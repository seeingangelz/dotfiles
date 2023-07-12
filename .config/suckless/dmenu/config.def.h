static int topbar      = 1;       /* -b  option; if 0, dmenu appears at bottom */
static int centered    = 1;       /* -c option; centers dmenu on screen */
static int colorprompt = 1;       /* -p  option; if 1, prompt uses SchemeSel, otherwise SchemeNorm */
static int min_width   = 350;     /* minimum width when centered */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "JetBrainsMono Nerd Font:style=Bold:size=8:antialias=true:autohint=true",
    "NotoColorEmoji:pixelsize=8:antialias=true:autohint=true"};

static const unsigned int bgalpha = 0xd0;
static const unsigned int fgalpha = OPAQUE;
static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*                          fg         bg   */
    [SchemeNorm]          = {"#bbbbbb", "#222222"},
    [SchemeSel]           = {"#eeeeee", "#005577"},
    [SchemeSelHighlight]  = {"#ffffff", "#222222"},
    [SchemeNormHighlight] = {"#ffffff", "#222222"},
    [SchemeOut]           = {"#000000", "#00ffff"},
};
static const unsigned int alphas[SchemeLast][2] = {
    /*                      fgalpha  bgalpha  */
    [SchemeNorm]          = {fgalpha, bgalpha},
    [SchemeSel]           = {fgalpha, bgalpha},
    [SchemeSelHighlight]  = {fgalpha, bgalpha},
    [SchemeNormHighlight] = {fgalpha, bgalpha},
    [SchemeOut]           = {fgalpha, bgalpha},
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 2;
