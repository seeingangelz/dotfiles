/* appearance */
static unsigned int borderpx              = 2;   /* border pixel of windows */
static unsigned int snap                  = 0;   /* snap pixel */
static const unsigned int systraypinning  = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft   = 0;   /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing  = 2;   /* systray spacing */
static const int systraypinningfailfirst  = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray              = 0;   /* 0 means no systray */
static unsigned int gappx                 = 6;   /* gaps between windows */
static const int swallowfloating          = 0;   /* 1 means swallow floating windows by default */
static int showbar                        = 1;   /* 0 means no bar */
static int topbar                         = 1;   /* 0 means bottom bar */
static char font[]                        = "JetBrainsMono:size=8";
static char dmenufont[]                   = "JetBrainsMono:size=8";
static const char *fonts[]                = { font };
static char normbgcolor[]                 = "#222222";
static char normbordercolor[]             = "#444444";
static char normfgcolor[]                 = "#bbbbbb";
static char selfgcolor[]                  = "#eeeeee";
static char selbordercolor[]              = "#005577";
static char selbgcolor[]                  = "#005577";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3] = {
       /*                       fg           bg           border      */
       [SchemeNorm]     = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]      = { selfgcolor,  selbgcolor,  selbordercolor  },
       [SchemeStatus]   = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeTagsSel]  = { selfgcolor,  selbgcolor,  normbordercolor },
       [SchemeTagsNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeInfoSel]  = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeInfoNorm] = { normfgcolor, normbgcolor, normbordercolor },
};

static const unsigned int alphas[][3]      = {
	/*                     fg       bg        border   */
	[SchemeNorm]     = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]      = { OPAQUE, baralpha, borderalpha },
  [SchemeStatus]   = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsSel]  = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeInfoSel]  = { OPAQUE, baralpha, borderalpha },
	[SchemeInfoNorm] = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
//static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const char *tags[] = { "", "", "", "", "", "", "", "" };
//static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII" };

static const Rule rules[] = {
       /* xprop(1):
	*	WM_CLASS(STRING) = instance, class
	*	WM_NAME(STRING) = title
	*/
	/* class              instance   title   tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",              NULL,     NULL,       0,         0,          0,           0,        -1 },
	{ "Emacs",             NULL,     NULL,    1<<2,         0,          0,          -1,        -1 },
	{ "firefox",           NULL,     NULL,    1<<3,         0,          0,          -1,        -1 },
	{ "qutebrowser",       NULL,     NULL,    1<<3,         0,          0,          -1,        -1 },
	{ "Steam",             NULL,     NULL,    1<<4,         0,          0,          -1,        -1 },
	{ "TelegramDesktop",   NULL,     NULL,    1<<5,         0,          0,          -1,        -1 },
	{ "St",                NULL,     NULL,       0,         0,          1,           0,        -1 },
	{ "obs",               NULL,     NULL,    1<<7,         0,          0,           1,        -1 },
	{  NULL,               NULL,   "cmus",    1<<6,         0,          0,           1,        -1 },
	{  NULL,               NULL, "ranger",    1<<1,         0,          0,           0,        -1 },
	{ "Qalculate-gtk",     NULL,     NULL,       0,         1,          0,           1,        -1 },
};

/* layout(s) */
static float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
 	{ "[@]",      spiral },
 	{ "[\\]",     dwindle },
  { "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]         =    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]   =  { "dmenu_run", "-l", "20", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]    =  { "st", NULL };
static const char *screenshot[]	=  { "screenshot", NULL };
static const char *fullshot[]   =  { "flameshot", "full", NULL };
static const char *browser[]	  =  { "firefox", NULL };
static const char *ranger[]	    =  { "st", "-e", "ranger", NULL };
static const char *cmus[]	      =  { "st", "-e", "cmus", NULL };
static const char *slock[] 	    =  { "slock", NULL };
static const char *qalc[] 	    =  { "qalculate-gtk", NULL };
static const char *telegram[]	  =  { "telegram-desktop", "-l", NULL };
static const char *wall[]	      =  { "wg", NULL };
static const char *emoji[]	    =  { "emoji", NULL };
static const char *emacs[]	    =  { "emacs", NULL };
static const char *dfiles[]	    =  { "dfiles", NULL };
static const char *pulse[]	    =  { "st", "-e", "pulsemixer", NULL };
static const char *inclight[]	  =  { "xbacklight", "-inc", "10", NULL };
static const char *declight[]	  =  { "xbacklight", "-dec", "10", NULL };
static const char *night[]	    =  { "nightmode", NULL };
static const char *volup[]	    =  { "pulsemixer", "--change", "+5", NULL };
static const char *voldown[]	  =  { "pulsemixer", "--change", "-5", NULL };
static const char *volmute[]	  =  { "togglemute", NULL };

/* Xresources preferences to load at startup */
ResourcePref resources[] = {
	 	{ "color4", 		        STRING,  &normbordercolor},
    { "color14", 		        STRING,  &selbordercolor},
    { "color0", 		        STRING,  &normbgcolor},
 		{ "color4", 		        STRING,  &normfgcolor},
 		{ "color0", 		        STRING,  &selfgcolor},
 		{ "color4", 		        STRING,  &selbgcolor},
    { "font",               STRING,  &font },
    { "dmenufont",          STRING,  &dmenufont },
		{ "normbgcolor",        STRING,  &normbgcolor },
		{ "normbordercolor",    STRING,  &normbordercolor },
		{ "normfgcolor",        STRING,  &normfgcolor },
		{ "selbgcolor",         STRING,  &selbgcolor },
		{ "selbordercolor",     STRING,  &selbordercolor },
		{ "selfgcolor",         STRING,  &selfgcolor },
		{ "borderpx",          	INTEGER, &borderpx },
		{ "snap",          	    INTEGER, &snap },
		{ "showbar",          	INTEGER, &showbar },
		{ "topbar",          	  INTEGER, &topbar },
		{ "nmaster",          	INTEGER, &nmaster },
		{ "resizehints",       	INTEGER, &resizehints },
		{ "mfact",      	      FLOAT,   &mfact },
};

#include "selfrestart.c"
#include "movestack.c"
#include "exitdwm.c"

static const Key keys[] = {
	/* modifier                 key            function        argument */
	{ MODKEY,                   XK_p,          spawn,          {.v = dmenucmd } },
	{ MODKEY,             	    XK_Return,     spawn,          {.v = termcmd } },
	{ 0,                        XK_Print,      spawn,          {.v = screenshot } },
	{ MODKEY,                   XK_Print,      spawn,          {.v = fullshot } },
	{ MODKEY,                   XK_F1,         spawn,          {.v = ranger } },
	{ MODKEY,                   XK_F2,         spawn,          {.v = browser } },
	{ MODKEY,                   XK_F3,         spawn,          {.v = telegram } },
	{ MODKEY,                   XK_F4,         spawn,          {.v = cmus } },
	{ MODKEY,                   XK_F5,         spawn,          {.v = emacs } },
	{ MODKEY,                   XK_F6,         spawn,          {.v = pulse } },
	{ MODKEY,                   XK_F11,        spawn,          {.v = slock } },
	{ MODKEY,                   XK_F12,        spawn,          {.v = qalc } },
	{ 0,              			    0x1008ff13,    spawn,          {.v = volup } },
	{ 0,			                  0x1008ff11,    spawn,          {.v = voldown } },
	{ 0,			                  0x1008ff12,    spawn,          {.v = volmute } },
	{ 0,			                  0x1008ff02,    spawn,          {.v = inclight } },
	{ 0,			                  0x1008ff03,    spawn,          {.v = declight } },
	{ MODKEY|ShiftMask,         XK_n,          spawn,          {.v = night} },
	{ MODKEY|ShiftMask,         XK_e,          spawn,          {.v = wall} },
	{ MODKEY|ControlMask,       XK_e,          spawn,          {.v = emoji} },
	{ MODKEY|ShiftMask,         XK_s,          spawn,          {.v = dfiles} },
	{ MODKEY,                   XK_b,          togglebar,      {0} },
	{ MODKEY,                   XK_Left,       focusstack,     {.i = +1 } },
	{ MODKEY,                   XK_Right,      focusstack,     {.i = -1 } },
	{ MODKEY,                   XK_i,          incnmaster,     {.i = +1 } },
	{ MODKEY,                   XK_d,          incnmaster,     {.i = -1 } },
	{ MODKEY,                   XK_h,          setmfact,       {.f = -0.05} },
	{ MODKEY,                   XK_l,          setmfact,       {.f = +0.05} },
 	{ MODKEY,                   XK_k,          setcfact,       {.f = +0.25} },
	{ MODKEY,                   XK_j,          setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,         XK_o,          setcfact,       {.f =  0.00} },
	{ MODKEY|ShiftMask,         XK_Right,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,         XK_Left,       movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,         XK_Return,     zoom,           {0} },
	{ MODKEY,                   XK_Tab,        view,           {0} },
	{ MODKEY|ShiftMask,         XK_q,          killclient,     {0} },
	{ MODKEY,                   XK_t,          setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                   XK_f,          setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                   XK_m,          setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                   XK_u,          setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                   XK_o,          setlayout,      {.v = &layouts[6]} },
	{ MODKEY,                   XK_space,      setlayout,      {0} },
	{ MODKEY|ShiftMask,         XK_space,      togglefloating, {0} },
	{ MODKEY|ShiftMask,         XK_0,          tag,            {.ui = ~0 } },
	{ MODKEY,                   XK_comma,      focusmon,       {.i = -1 } },
	{ MODKEY,                   XK_period,     focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,         XK_comma,      tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,         XK_period,     tagmon,         {.i = +1 } },
	{ MODKEY,                   XK_minus,      setgaps,        {.i = -1 } },
	{ MODKEY,                   XK_equal,      setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,         XK_equal,      setgaps,        {.i = 0  } },
	TAGKEYS(                    XK_1,                          0)
	TAGKEYS(                    XK_2,                          1)
	TAGKEYS(                    XK_3,                          2)
	TAGKEYS(                    XK_4,                          3)
	TAGKEYS(                    XK_5,                          4)
	TAGKEYS(                    XK_6,                          5)
	TAGKEYS(                    XK_7,                          6)
	TAGKEYS(                    XK_8,                          7)
	TAGKEYS(                    XK_9,                          8)
	{ MODKEY|ShiftMask,         XK_c,          quit,           {0} },
	{ MODKEY|ShiftMask,         XK_p,          exitdwm,        {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
