/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprShard, 0, camera_get_view_x(view_camera[0]) + 70, camera_get_view_y(view_camera[0]) + 100)
draw_text(camera_get_view_x(view_camera[0]) + 110, camera_get_view_y(view_camera[0]) +100, "/")
draw_text(camera_get_view_x(view_camera[0]) + 100, camera_get_view_y(view_camera[0]) +100, objPlayer.shards)
draw_text(camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) +100, objPlayer.total)