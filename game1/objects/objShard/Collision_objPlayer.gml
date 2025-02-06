/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, objPlayer)){
	audio_play_sound(shard_sound, 0, 0)
	instance_destroy(self)
	objPlayer.shards++
}