From d47ba0b8aab26ffb2569c0d05df24fdd61b3f4b0 Mon Sep 17 00:00:00 2001
From: aymey <fabianpaci@gmail.com>
Date: Mon, 5 Dec 2022 22:57:41 +1100
Subject: [PATCH] Sticky windows respect EWMH

---
 dwm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/dwm.c b/dwm.c
index 253aba7..a9157bf 100644
--- a/dwm.c
+++ b/dwm.c
@@ -49,7 +49,7 @@
 #define CLEANMASK(mask)         (mask & ~(numlockmask|LockMask) & (ShiftMask|ControlMask|Mod1Mask|Mod2Mask|Mod3Mask|Mod4Mask|Mod5Mask))
 #define INTERSECT(x,y,w,h,m)    (MAX(0, MIN((x)+(w),(m)->wx+(m)->ww) - MAX((x),(m)->wx)) \
                                * MAX(0, MIN((y)+(h),(m)->wy+(m)->wh) - MAX((y),(m)->wy)))
-#define ISVISIBLE(C)            ((C->tags & C->mon->tagset[C->mon->seltags]))
+#define ISVISIBLE(C)            ((C->tags & C->mon->tagset[C->mon->seltags]) || C->issticky)
 #define LENGTH(X)               (sizeof X / sizeof X[0])
 #define MOUSEMASK               (BUTTONMASK|PointerMotionMask)
 #define WIDTH(X)                ((X)->w + 2 * (X)->bw)
@@ -61,7 +61,7 @@
 enum { CurNormal, CurResize, CurMove, CurLast }; /* cursor */
 enum { SchemeNorm, SchemeSel }; /* color schemes */
 enum { NetSupported, NetWMName, NetWMState, NetWMCheck,
-       NetWMFullscreen, NetActiveWindow, NetWMWindowType,
+       NetWMFullscreen, NetWMSticky, NetActiveWindow, NetWMWindowType,
        NetWMWindowTypeDialog, NetClientList, NetLast }; /* EWMH atoms */
 enum { WMProtocols, WMDelete, WMState, WMTakeFocus, WMLast }; /* default atoms */
 enum { ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
@@ -92,7 +92,7 @@ struct Client {
 	int basew, baseh, incw, inch, maxw, maxh, minw, minh, hintsvalid;
 	int bw, oldbw;
 	unsigned int tags;
-	int isfixed, isfloating, isurgent, neverfocus, oldstate, isfullscreen;
+	int isfixed, isfloating, isurgent, neverfocus, oldstate, isfullscreen, issticky;
 	Client *next;
 	Client *snext;
 	Monitor *mon;
@@ -200,6 +200,7 @@ static void sendmon(Client *c, Monitor *m);
 static void setclientstate(Client *c, long state);
 static void setfocus(Client *c);
 static void setfullscreen(Client *c, int fullscreen);
+static void setsticky(Client *c, int sticky);
 static void setlayout(const Arg *arg);
 static void setmfact(const Arg *arg);
 static void setup(void);
@@ -212,6 +213,7 @@ static void tagmon(const Arg *arg);
 static void tile(Monitor *m);
 static void togglebar(const Arg *arg);
 static void togglefloating(const Arg *arg);
+static void togglesticky(const Arg *arg);
 static void toggletag(const Arg *arg);
 static void toggleview(const Arg *arg);
 static void unfocus(Client *c, int setfocus);
@@ -526,6 +528,10 @@ clientmessage(XEvent *e)
 		|| cme->data.l[2] == netatom[NetWMFullscreen])
 			setfullscreen(c, (cme->data.l[0] == 1 /* _NET_WM_STATE_ADD    */
 				|| (cme->data.l[0] == 2 /* _NET_WM_STATE_TOGGLE */ && !c->isfullscreen)));
+
+        if (cme->data.l[1] == netatom[NetWMSticky]
+                || cme->data.l[2] == netatom[NetWMSticky])
+            setsticky(c, (cme->data.l[0] == 1 || (cme->data.l[0] == 2 && !c->issticky)));
 	} else if (cme->message_type == netatom[NetActiveWindow]) {
 		if (c != selmon->sel && !c->isurgent)
 			seturgent(c, 1);
@@ -1498,6 +1504,23 @@ setfullscreen(Client *c, int fullscreen)
 	}
 }
 
+void
+setsticky(Client *c, int sticky)
+{
+
+    if(sticky && !c->issticky) {
+        XChangeProperty(dpy, c->win, netatom[NetWMState], XA_ATOM, 32,
+                PropModeReplace, (unsigned char *) &netatom[NetWMSticky], 1);
+        c->issticky = 1;
+    } else if(!sticky && c->issticky){
+        XChangeProperty(dpy, c->win, netatom[NetWMState], XA_ATOM, 32,
+                PropModeReplace, (unsigned char *)0, 0);
+        c->issticky = 0;
+        arrange(c->mon);
+    }
+}
+
+
 void
 setlayout(const Arg *arg)
 {
@@ -1560,6 +1583,7 @@ setup(void)
 	netatom[NetWMState] = XInternAtom(dpy, "_NET_WM_STATE", False);
 	netatom[NetWMCheck] = XInternAtom(dpy, "_NET_SUPPORTING_WM_CHECK", False);
 	netatom[NetWMFullscreen] = XInternAtom(dpy, "_NET_WM_STATE_FULLSCREEN", False);
+    netatom[NetWMSticky] = XInternAtom(dpy, "_NET_WM_STATE_STICKY", False);
 	netatom[NetWMWindowType] = XInternAtom(dpy, "_NET_WM_WINDOW_TYPE", False);
 	netatom[NetWMWindowTypeDialog] = XInternAtom(dpy, "_NET_WM_WINDOW_TYPE_DIALOG", False);
 	netatom[NetClientList] = XInternAtom(dpy, "_NET_CLIENT_LIST", False);
@@ -1719,6 +1743,15 @@ togglefloating(const Arg *arg)
 	arrange(selmon);
 }
 
+void
+togglesticky(const Arg *arg)
+{
+	if (!selmon->sel)
+		return;
+    setsticky(selmon->sel, !selmon->sel->issticky);
+	arrange(selmon);
+}
+
 void
 toggletag(const Arg *arg)
 {
@@ -2009,10 +2042,13 @@ updatewindowtype(Client *c)
 	Atom state = getatomprop(c, netatom[NetWMState]);
 	Atom wtype = getatomprop(c, netatom[NetWMWindowType]);
 
-	if (state == netatom[NetWMFullscreen])
-		setfullscreen(c, 1);
-	if (wtype == netatom[NetWMWindowTypeDialog])
-		c->isfloating = 1;
+    if (state == netatom[NetWMFullscreen])
+        setfullscreen(c, 1);
+    if (state == netatom[NetWMSticky]) {
+        setsticky(c, 1);
+    }
+    if (wtype == netatom[NetWMWindowTypeDialog])
+        c->isfloating = 1;
 }
 
 void
@@ -2147,3 +2183,4 @@ main(int argc, char *argv[])
 	XCloseDisplay(dpy);
 	return EXIT_SUCCESS;
 }
+
-- 
2.38.1

