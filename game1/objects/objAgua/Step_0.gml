/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Agua");
var spr_id = layer_sprite_get_id(lay_id, "sprAgua");
layer_sprite_alpha(spr_id, random(1));