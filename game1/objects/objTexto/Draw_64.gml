/// @description Insert description here
// You can write your code in this editor
var guil = display_get_gui_width();
var guia = display_get_gui_height();

var xx = 0
var yy = guia - 200;
var c = c_black;
draw_set_font(Font1)
draw_rectangle_color(xx, yy, guil, guia, c, c, c, c, false)
draw_text_ext(xx + 32, yy + 32, texto[pagina], 32, guil - 64)