/// @description Insert description here
// You can write your code in this editor
if inicio == false{
	scrTexto()
	inicio = true
}

if keyboard_check_pressed(ord("E")){
	if pagina < array_length(texto) - 1{
		pagina++
	}else{
		global.dialogo = false
		instance_destroy();	
		switch npcNome{
			case "teste":
				audio_stop_all();
				room_goto(Room2);
				break
			case "2":
			audio_stop_all()
			room_goto(Room1)
			break
		}
	}
}