#region CONTROLES
key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A")) //o "ord" pega qualquer tecla do teclado
key_jmp = keyboard_check_pressed(vk_space)
key_e = keyboard_check_pressed(ord("E"))
key_shift = keyboard_check(vk_shift)
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))
#endregion
#region MOVIMENTAÇÃO
var move = key_right - key_left
hspd = move * spd;
vspd += grv
if (hspd != 0) 
image_xscale = sign(hspd) //inverter o sprite, se a tecla direita for pressionada, então a tecla direita é verdadeira, logo é positiva
#endregion
#region COLISÃO

if place_meeting(x + hspd, y, objParent){ //colisão com qualquer objeto pai(chao, parede etc)
	if !place_meeting(x + hspd, y - abs(hspd) - 1, objParent){ //checa se tem uma rampa
		while place_meeting(x + hspd, y, objParent) //sobe rampa
			y -= .5
	}else{
		var pixelCheck = .5 * sign(hspd);
		while !place_meeting(x + pixelCheck, y, objParent){
			x += pixelCheck		 				
		}
		hspd = 0
	}
}
if (place_meeting(x,y + vspd, objParent)) { //
  vspd = 0;
} 



//descer rampas
if vspd >= 0 and !place_meeting(x + hspd, y + 1, objParent) and place_meeting(x + hspd, y + abs(hspd)+1, objParent){
	while !place_meeting(x + hspd, y + .5, objParent){
		y += .5
	}
}
if move !=0{
sprite_index = sprPlayerRun	
}else{
	sprite_index = spr_player
}
x += hspd
y += vspd

#endregion
#region DIALOGO
if distance_to_object(objNPCParent) < 10{ //checa se tem um npc proximo
	if keyboard_check_pressed(ord("E")){ //se a tecla E foi pressionada
		var npc = instance_nearest(x, y, objNPCParent) //atribui o valor do npc mais proximo a _npc
		var dialogo = instance_create_layer(x, y, "Dialogo", objTexto) //e entao é criado uma instancia para o dialogo
		dialogo.npcNome = npc.nome //
	}
}

#endregion
#region pulo
// PULO
if place_meeting(x,y+1,objParent) and key_jmp
{
	audio_play_sound(_8_Bit_Jump_Sound_Effect__Copyright_Free__1, 0, 0)
vspd -=8	
}
#endregion
#region MOVIMENTAÇÃO AGUA
if(place_meeting(x, y, objAgua)){
	sprite_index = Sprite14
	vspd = 0
	if (key_down) {
    vspd += 6
	}
	if (key_up) or keyboard_check(vk_space) {
    vspd -= 6
	}
}


// Mover para a direita quando a seta direita é pressionada


if distance_to_object(objAltar) < 10 and key_e and shards > 0{
	objAltar.shardTotal ++
	shards --
	total --
	audio_play_sound(shard_sound, 0, 0)
}

if place_meeting(x,y, objSpike){
audio_stop_all()
room_restart()
}


#endregion
