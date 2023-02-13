From 728d397b21982af88737277fd9d6939a7b558786 Mon Sep 17 00:00:00 2001
From: Christian Tenllado <ctenllado@gmail.com>
Date: Tue, 14 Apr 2020 23:31:15 +0200
Subject: [PATCH] Multiple scratchpads

This patch enables multiple scratchpads, each with one asigned window.
This enables the same scratchpad workflow that you have in i3.

Scratchpads are implemented as special tags, whose mask does not
apply to new spawned windows. To assign a window to a scratchpad you
have to set up a rule, as you do with regular tags.

Windows tagged with scratchpad tags can be set floating or not in the
rules array. Most users would probably want them floating (i3 style),
but having them tiled does also perfectly work and might fit better the
DWM approach. In case they are set floating, the patch moves them to the
center of the screen whenever they are shown. The patch can easily be
modified to make this last feature configurable in the rules array (see
the center patch).

The togglescratch function, borrowed from the previous scratchpad patch
and slightly modified, can be used to spawn a registered scratchpad
process or toggle its view. This function looks for a window tagged with
the selected scratchpad tag. If it is found its view is toggled. If it is
not found the corresponding registered command is spawned. The
config.def.h shows three examples of its use to spawn a terminal in the
first scratchpad tag, a second terminal running ranger on the second
scratchpad tag and the keepassxc application to manage passwords on a
third scratchpad tag.

If you prefer to spawn your scratchpad applications from the startup
script, you might opt for binding keys to toggleview instead, as
scratchpads are just special tags (you may even extend the TAGKEYS macro
to generalize the key bindings).
---
 config.def.h | 28 ++++++++++++++++++++++++----
 dwm.c        | 43 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/config.def.h b/config.def.h
index 1c0b587..06265e1 100644
--- a/config.def.h
+++ b/config.def.h
@@ -18,17 +18,33 @@ static const char *colors[][3]      = {
 	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
 };
 
+typedef struct {
+	const char *name;
+	const void *cmd;
+} Sp;
+const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", NULL };
+const char *spcmd2[] = {"st", "-n", "spfm", "-g", "144x41", "-e", "ranger", NULL };
+const char *spcmd3[] = {"keepassxc", NULL };
+static Sp scratchpads[] = {
+	/* name          cmd  */
+	{"spterm",      spcmd1},
+	{"spranger",    spcmd2},
+	{"keepassxc",   spcmd3},
+};
+
 /* tagging */
 static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
-
 static const Rule rules[] = {
 	/* xprop(1):
 	 *	WM_CLASS(STRING) = instance, class
 	 *	WM_NAME(STRING) = title
 	 */
 	/* class      instance    title       tags mask     isfloating   monitor */
-	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
-	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
+	{ "Gimp",	  NULL,			NULL,		0,				1,			 -1 },
+	{ "Firefox",  NULL,			NULL,		1 << 8,			0,			 -1 },
+	{ NULL,		  "spterm",		NULL,		SPTAG(0),		1,			 -1 },
+	{ NULL,		  "spfm",		NULL,		SPTAG(1),		1,			 -1 },
+	{ NULL,		  "keepassxc",	NULL,		SPTAG(2),		0,			 -1 },
 };
 
 /* layout(s) */
@@ -59,6 +75,7 @@ static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn()
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
 static const char *termcmd[]  = { "st", NULL };
 
+
 static Key keys[] = {
 	/* modifier                     key        function        argument */
 	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
@@ -84,6 +101,9 @@ static Key keys[] = {
 	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
 	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
 	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
+	{ MODKEY,            			XK_y,  	   togglescratch,  {.ui = 0 } },
+	{ MODKEY,            			XK_u,	   togglescratch,  {.ui = 1 } },
+	{ MODKEY,            			XK_x,	   togglescratch,  {.ui = 2 } },
 	TAGKEYS(                        XK_1,                      0)
 	TAGKEYS(                        XK_2,                      1)
 	TAGKEYS(                        XK_3,                      2)
@@ -106,7 +126,7 @@ static Button buttons[] = {
 	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
 	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
 	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
-	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
+	{ ClkClientWin,         MODKEY,         Button1,        resizemouse,    {0} },
 	{ ClkTagBar,            0,              Button1,        view,           {0} },
 	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
 	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
diff --git a/dwm.c b/dwm.c
index 4465af1..646aa1a 100644
--- a/dwm.c
+++ b/dwm.c
@@ -54,7 +54,10 @@
 #define MOUSEMASK               (BUTTONMASK|PointerMotionMask)
 #define WIDTH(X)                ((X)->w + 2 * (X)->bw)
 #define HEIGHT(X)               ((X)->h + 2 * (X)->bw)
-#define TAGMASK                 ((1 << LENGTH(tags)) - 1)
+#define NUMTAGS					(LENGTH(tags) + LENGTH(scratchpads))
+#define TAGMASK     			((1 << NUMTAGS) - 1)
+#define SPTAG(i) 				((1 << LENGTH(tags)) << (i))
+#define SPTAGMASK   			(((1 << LENGTH(scratchpads))-1) << LENGTH(tags))
 #define TEXTW(X)                (drw_fontset_getwidth(drw, (X)) + lrpad)
 
 /* enums */
@@ -211,6 +214,7 @@ static void tagmon(const Arg *arg);
 static void tile(Monitor *);
 static void togglebar(const Arg *arg);
 static void togglefloating(const Arg *arg);
+static void togglescratch(const Arg *arg);
 static void toggletag(const Arg *arg);
 static void toggleview(const Arg *arg);
 static void unfocus(Client *c, int setfocus);
@@ -299,6 +303,11 @@ applyrules(Client *c)
 		{
 			c->isfloating = r->isfloating;
 			c->tags |= r->tags;
+			if ((r->tags & SPTAGMASK) && r->isfloating) {
+				c->x = c->mon->wx + (c->mon->ww / 2 - WIDTH(c) / 2);
+				c->y = c->mon->wy + (c->mon->wh / 2 - HEIGHT(c) / 2);
+			}
+
 			for (m = mons; m && m->num != r->monitor; m = m->next);
 			if (m)
 				c->mon = m;
@@ -308,7 +317,7 @@ applyrules(Client *c)
 		XFree(ch.res_class);
 	if (ch.res_name)
 		XFree(ch.res_name);
-	c->tags = c->tags & TAGMASK ? c->tags & TAGMASK : c->mon->tagset[c->mon->seltags];
+	c->tags = c->tags & TAGMASK ? c->tags & TAGMASK : (c->mon->tagset[c->mon->seltags] & ~SPTAGMASK);
 }
 
 int
@@ -1616,6 +1625,10 @@ showhide(Client *c)
 	if (!c)
 		return;
 	if (ISVISIBLE(c)) {
+		if ((c->tags & SPTAGMASK) && c->isfloating) {
+			c->x = c->mon->wx + (c->mon->ww / 2 - WIDTH(c) / 2);
+			c->y = c->mon->wy + (c->mon->wh / 2 - HEIGHT(c) / 2);
+		}
 		/* show clients top down */
 		XMoveWindow(dpy, c->win, c->x, c->y);
 		if ((!c->mon->lt[c->mon->sellt]->arrange || c->isfloating) && !c->isfullscreen)
@@ -1719,6 +1732,32 @@ togglefloating(const Arg *arg)
 	arrange(selmon);
 }
 
+void
+togglescratch(const Arg *arg)
+{
+	Client *c;
+	unsigned int found = 0;
+	unsigned int scratchtag = SPTAG(arg->ui);
+	Arg sparg = {.v = scratchpads[arg->ui].cmd};
+
+	for (c = selmon->clients; c && !(found = c->tags & scratchtag); c = c->next);
+	if (found) {
+		unsigned int newtagset = selmon->tagset[selmon->seltags] ^ scratchtag;
+		if (newtagset) {
+			selmon->tagset[selmon->seltags] = newtagset;
+			focus(NULL);
+			arrange(selmon);
+		}
+		if (ISVISIBLE(c)) {
+			focus(c);
+			restack(selmon);
+		}
+	} else {
+		selmon->tagset[selmon->seltags] |= scratchtag;
+		spawn(&sparg);
+	}
+}
+
 void
 toggletag(const Arg *arg)
 {
-- 
2.20.1

