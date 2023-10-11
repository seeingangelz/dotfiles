#include "config.h"

#include "block.h"
#include "util.h"

Block blocks[] = {
	{"s_cmus",             1,       11},
	//{"s_mpd",              1,       19},
	{"s_spotify",          1,       18},
    {"s_cpu",              5,       12},
    {"s_hdd",           1200,       14},
    {"s_mem",              5,       13},
    //{"s_nettraf",          1,       20},
    {"s_upd",           3600,        8},
    //{"s_battery",         10,       16},
    //{"s_bri",             10,       17},
    {"s_mic",              0,        9},
    {"s_vol",              0,        7},
    {"s_date",            60,       10},
    {"s_net",             60,       15},
};

const unsigned short blockCount = LEN(blocks);
