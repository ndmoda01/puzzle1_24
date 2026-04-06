/// @description Insert description here

if (instance_exists(obj_music)) and (audio_is_paused(obj_music.level_music)){
	audio_resume_sound(obj_music.level_music);	
}