/// @description Insert description here

key_up = gamepad_button_check_pressed(0, gp_padu)  || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down = gamepad_button_check_pressed(0, gp_padd)  || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
key_select = gamepad_button_check_pressed(0, gp_face1)  || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"));


if (place_meeting(x,y,obj_button) and (instance_exists(inst_DESCRIPTION))){
	_button = instance_place(x,y,obj_button);
	
	if (_button.my_text_2 != ""){
			inst_DESCRIPTION.my_text = _button.my_text_2;
	}
	
}

//check for alt being pressed to prevent selecting when putting into or out of fullscreen
if (place_meeting(x,y,obj_button) and (key_select)) and (!keyboard_check_direct(vk_alt)){
	var _button = instance_place(x,y,obj_button);
	with (_button){
		//only activate if the button is selectable
		if (selectable == true){
			audio_play_sound(snd_button_selected,5,false);
		
			activate_button();
		}
	}
}


//move up and down
if (key_up) {
audio_play_sound(snd_menu_cursor_movement,5,false);
	if (position_index > 0){	
		position_index --;
	}
	//wrap to last entry in array
	else {
		//loop from the last entry until it is not blank
		for(var i = array_length(position)-1; i > 0;i--){
			if (position[i] != -1){ 
				position_index = i;
				x = position[position_index,0];
				y = position[position_index,1];
				exit;
			}
		}
	}
}
if (key_down){
audio_play_sound(snd_menu_cursor_movement,5,false);
	//wrap
	if (position[position_index+1] == -1) position_index = 0;	
	else position_index ++;

}

x = position[position_index,0];
y = position[position_index,1];
