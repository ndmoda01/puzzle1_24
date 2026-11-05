/// @description Insert description here

if (pause_frames > 0) pause_frames--;
if (pause_frames <= 0) image_speed = 1;

if (image_index < 1){
	image_alpha = .90;

	
}
if (image_index >= 1) and (image_index < 2){
	image_alpha = .6;

}
if (image_index >= 2){
	image_alpha = .3;

}