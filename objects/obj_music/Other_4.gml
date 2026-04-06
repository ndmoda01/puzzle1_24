
var _level = obj_game.level;
if (_level > 10) and ((obj_game.game_type == ENDURANCE) or (obj_game.game_type == MARATHON))  _level = _level mod 10; 

if (room == rm_attract_mode){
	_level = irandom_range(1,10);
	if audio_is_playing(sng_princess_quest){
		audio_stop_sound(sng_princess_quest);
	}
}

if (room == rm_main_menu){
	
	if audio_is_playing(sng_princess_quest){
		//keep on playing
		
	}
	//if it's not playing, stop anything that is playing, and play menu song
	else{
		audio_stop_all();
		audio_play_sound(sng_princess_quest,0,true);
	}
}
else if (room != rm_main_menu) and 
(room != rm_credits) and 
(room != rm_game_type_menu) and 
(room != rm_high_scores) and 
(room != rm_controls) and 
(room != rm_1P_level_00) and 
(room != rm_1P_level_00_CR) and 
(room != rm_2P_level_00) and 
(room != rm_2P_level_00_CR) and 
(room != rm_2P_level_00_RK) and 
(room != rm_3P_level0) and 
(room != rm_4P_level0){
	
	audio_stop_sound(level_music);
	
	if (obj_game.game_type == MARATHON){
		
		audio_stop_all();
		audio_play_sound(level_playlist[0],0,false);
	}
	else{
		switch(_level){	
		
			//this song can only play in a level if it is endurance mode
			//and it is a level ending in 0, like 30 or 40
			case 0:
				level_music = audio_play_sound(sng_princess_quest,0,true);
			break;
	
			case 1:
				if audio_is_playing(sng_princess_quest){
					audio_stop_sound(sng_princess_quest);
				}
				level_music = audio_play_sound(sng_deep_blue,0,true);
			break;
	
			case 2:
				level_music = audio_play_sound(sng_modern_bits,0,true);
			break;
		
			case 3:
				level_music = audio_play_sound(sng_penguin_town,0,true);
			break;
		
			case 4:
				level_music = audio_play_sound(sng_penguins_vs_rabbits,0,true);
			break;
		
			case 5:
				level_music = audio_play_sound(sng_sanctuary,0,true);
			break;
		
			case 6:
				level_music = audio_play_sound(sng_rumble_at_the_gates,0,true);
			break;
		
			case 7:
				level_music = audio_play_sound(sng_box_jump,0,true);
			break;
		
			case 8:
				level_music = audio_play_sound(sng_go,0,true);
			break;
		
			case 9:
				level_music = audio_play_sound(sng_pixel_war_2,0,true);
			break;
		
			case 10:
				level_music = audio_play_sound(sng_out_of_time,0,true);
			break;
		
			case 11:
				level_music = -1;
			break;
	
		}
	}
	
}
else if (room == rm_ending){
	audio_stop_all();
	level_music = -1;	
}