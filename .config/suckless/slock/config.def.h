/* user and group to drop privileges to */
static const char *user  = "aeon";
static const char *group = "power";

static const char *colorname[NUMCOLS] = {
  [INIT] =   "#000000",   /* after initialization */
  [INPUT] =  "#282c34",   /* during input */
  [FAILED] = "#be5046",   /* wrong password */
};

/* lock screen opacity */
static const float alpha = 0.5;

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "Enter password to unlock";

/* text color */
static const char * text_color = "#abb2bf";

/* text size (must be a valid size) */
static const char * text_size = "fixed";
