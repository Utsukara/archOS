static const char norm_fg[] = "#cedbd7";
static const char norm_bg[] = "#161d1c";
static const char norm_border[] = "#909996";

static const char sel_fg[] = "#cedbd7";
static const char sel_bg[] = "#E9CF72";
static const char sel_border[] = "#cedbd7";

static const char urg_fg[] = "#cedbd7";
static const char urg_bg[] = "#D8A06B";
static const char urg_border[] = "#D8A06B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
