/*
if(instance_exists(obj_level_intro)) audio_pause_sound(level_music); 

if (obj_game.level_timer <= 0) and (obj_game.game_type == CLASSIC) and (obj_game.game_over == false){
	if (level_music != -1){
		audio_stop_sound(level_music);
	}
}

if (obj_game.game_type == MARATHON) and (obj_game.game_over == false){

	if(instance_exists(obj_level_intro)) audio_pause_sound(level_playlist[song_index]); 
	if (!instance_exists(obj_level_intro)) audio_resume_sound(level_playlist[song_index]);
	
	
	//if the current track is done playing
	if (!audio_is_playing(level_playlist[song_index])) and (!audio_is_playing(main_menu_song)){
		//increment the index to start the next track
		song_index++;
		//wrap around if you're out of songs
		if (song_index > (array_length(level_playlist)-1)) song_index = 0;
		//play the next song (but don't repeat it)
		audio_play_sound(level_playlist[song_index],0,false);
	}
	
}



if (obj_game.game_over == true){
	audio_stop_sound(level_music);
	audio_stop_sound(level_playlist[song_index]);
	level_music = -1;
}