//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	 /*Command*/		 /*Update Interval*/	/*Update Signal*/
	{"",        "s_cmus",               1,		            0},
	{"",        "s_cpu", 	              5,		            0},
	{"",        "s_hdd", 	           1200,		            0},
	{"",        "s_mem",	              5,		            0},
	{"",        "s_upd",	           3600,		            6},
	{"",        "s_vol",	              0,		            5},
	{"",        "s_battery",		       20,		            0},
	{"",        "s_date",					     60,		            0},
	{"",        "s_net",					     60,		            0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
