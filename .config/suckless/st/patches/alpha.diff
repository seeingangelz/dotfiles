diff --git a/config.def.h b/config.def.h
index 91ab8ca..6af616e 100644
--- a/config.def.h
+++ b/config.def.h
@@ -93,6 +93,9 @@ char *termname = "st-256color";
  */
 unsigned int tabspaces = 8;
 
+/* bg opacity */
+float alpha = 0.8;
+
 /* Terminal colors (16 first used in escape sequence) */
 static const char *colorname[] = {
 	/* 8 normal colors */
diff --git a/config.mk b/config.mk
index 4c4c5d5..0114bad 100644
--- a/config.mk
+++ b/config.mk
@@ -16,7 +16,7 @@ PKG_CONFIG = pkg-config
 INCS = -I$(X11INC) \
        `$(PKG_CONFIG) --cflags fontconfig` \
        `$(PKG_CONFIG) --cflags freetype2`
-LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
+LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft -lXrender\
        `$(PKG_CONFIG) --libs fontconfig` \
        `$(PKG_CONFIG) --libs freetype2`
 
diff --git a/st.h b/st.h
index 519b9bd..8bb533d 100644
--- a/st.h
+++ b/st.h
@@ -126,3 +126,4 @@ extern unsigned int tabspaces;
 extern unsigned int defaultfg;
 extern unsigned int defaultbg;
 extern unsigned int defaultcs;
+extern float alpha;
diff --git a/x.c b/x.c
index 8a16faa..ddf4178 100644
--- a/x.c
+++ b/x.c
@@ -105,6 +105,7 @@ typedef struct {
 	XSetWindowAttributes attrs;
 	int scr;
 	int isfixed; /* is fixed geometry? */
+	int depth; /* bit depth */
 	int l, t; /* left and top offset */
 	int gm; /* geometry mask */
 } XWindow;
@@ -243,6 +244,7 @@ static char *usedfont = NULL;
 static double usedfontsize = 0;
 static double defaultfontsize = 0;
 
+static char *opt_alpha = NULL;
 static char *opt_class = NULL;
 static char **opt_cmd  = NULL;
 static char *opt_embed = NULL;
@@ -736,7 +738,7 @@ xresize(int col, int row)
 
 	XFreePixmap(xw.dpy, xw.buf);
 	xw.buf = XCreatePixmap(xw.dpy, xw.win, win.w, win.h,
-			DefaultDepth(xw.dpy, xw.scr));
+			xw.depth);
 	XftDrawChange(xw.draw, xw.buf);
 	xclear(0, 0, win.w, win.h);
 
@@ -796,6 +798,13 @@ xloadcols(void)
 			else
 				die("could not allocate color %d\n", i);
 		}
+
+	/* set alpha value of bg color */
+	if (opt_alpha)
+		alpha = strtof(opt_alpha, NULL);
+	dc.col[defaultbg].color.alpha = (unsigned short)(0xffff * alpha);
+	dc.col[defaultbg].pixel &= 0x00FFFFFF;
+	dc.col[defaultbg].pixel |= (unsigned char)(0xff * alpha) << 24;
 	loaded = 1;
 }
 
@@ -1118,11 +1127,23 @@ xinit(int cols, int rows)
 	Window parent;
 	pid_t thispid = getpid();
 	XColor xmousefg, xmousebg;
+	XWindowAttributes attr;
+	XVisualInfo vis;
 
 	if (!(xw.dpy = XOpenDisplay(NULL)))
 		die("can't open display\n");
 	xw.scr = XDefaultScreen(xw.dpy);
-	xw.vis = XDefaultVisual(xw.dpy, xw.scr);
+
+	if (!(opt_embed && (parent = strtol(opt_embed, NULL, 0)))) {
+		parent = XRootWindow(xw.dpy, xw.scr);
+		xw.depth = 32;
+	} else {
+		XGetWindowAttributes(xw.dpy, parent, &attr);
+		xw.depth = attr.depth;
+	}
+
+	XMatchVisualInfo(xw.dpy, xw.scr, xw.depth, TrueColor, &vis);
+	xw.vis = vis.visual;
 
 	/* font */
 	if (!FcInit())
@@ -1132,7 +1153,7 @@ xinit(int cols, int rows)
 	xloadfonts(usedfont, 0);
 
 	/* colors */
-	xw.cmap = XDefaultColormap(xw.dpy, xw.scr);
+	xw.cmap = XCreateColormap(xw.dpy, parent, xw.vis, None);
 	xloadcols();
 
 	/* adjust fixed window geometry */
@@ -1152,19 +1173,15 @@ xinit(int cols, int rows)
 		| ButtonMotionMask | ButtonPressMask | ButtonReleaseMask;
 	xw.attrs.colormap = xw.cmap;
 
-	if (!(opt_embed && (parent = strtol(opt_embed, NULL, 0))))
-		parent = XRootWindow(xw.dpy, xw.scr);
 	xw.win = XCreateWindow(xw.dpy, parent, xw.l, xw.t,
-			win.w, win.h, 0, XDefaultDepth(xw.dpy, xw.scr), InputOutput,
+			win.w, win.h, 0, xw.depth, InputOutput,
 			xw.vis, CWBackPixel | CWBorderPixel | CWBitGravity
 			| CWEventMask | CWColormap, &xw.attrs);
 
 	memset(&gcvalues, 0, sizeof(gcvalues));
 	gcvalues.graphics_exposures = False;
-	dc.gc = XCreateGC(xw.dpy, parent, GCGraphicsExposures,
-			&gcvalues);
-	xw.buf = XCreatePixmap(xw.dpy, xw.win, win.w, win.h,
-			DefaultDepth(xw.dpy, xw.scr));
+	xw.buf = XCreatePixmap(xw.dpy, xw.win, win.w, win.h, xw.depth);
+	dc.gc = XCreateGC(xw.dpy, xw.buf, GCGraphicsExposures, &gcvalues);
 	XSetForeground(xw.dpy, dc.gc, dc.col[defaultbg].pixel);
 	XFillRectangle(xw.dpy, xw.buf, dc.gc, 0, 0, win.w, win.h);
 
@@ -2019,6 +2036,9 @@ main(int argc, char *argv[])
 	case 'a':
 		allowaltscreen = 0;
 		break;
+	case 'A':
+		opt_alpha = EARGF(usage());
+		break;
 	case 'c':
 		opt_class = EARGF(usage());
 		break;
