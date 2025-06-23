const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#161d1c", /* black   */
  [1] = "#D8A06B", /* red     */
  [2] = "#E9CF72", /* green   */
  [3] = "#708B8C", /* yellow  */
  [4] = "#AAA28D", /* blue    */
  [5] = "#D4B293", /* magenta */
  [6] = "#EDD2A3", /* cyan    */
  [7] = "#cedbd7", /* white   */

  /* 8 bright colors */
  [8]  = "#909996",  /* black   */
  [9]  = "#D8A06B",  /* red     */
  [10] = "#E9CF72", /* green   */
  [11] = "#708B8C", /* yellow  */
  [12] = "#AAA28D", /* blue    */
  [13] = "#D4B293", /* magenta */
  [14] = "#EDD2A3", /* cyan    */
  [15] = "#cedbd7", /* white   */

  /* special colors */
  [256] = "#161d1c", /* background */
  [257] = "#cedbd7", /* foreground */
  [258] = "#cedbd7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
