/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result;

//screenshot
//window size, screenshot size
//game fullscreen,    screenshot 2560x1440
//game normal window, screenshot 1920x1080
//game 667x881,       screenshot 667x375 (black boarders not captured in screen shot)
//screenshot size is whatever the window size is, minus the black bar area (if there are any)
//screenshot is only of the "game" area of the window
//screenshot must be scaled to the draw gui (1920x1080) so that it looks correct

//screenshot doesn't seem to be scaling properly in fullscreen mode
//screenshot displays zoomed in when at fullscreen or zoomed out when smaller than 1080
//screenshot is taken at 1440, then that image is displayed in a 1080 game resolution making it seem zoomed in

//get ratio of internal game resolution 1920 x 1080 to current viewport


view_width = view_get_wport(0);
view_height = view_get_hport(0);

width_ratio = 1920/window_get_width();
height_ratio = 1080/window_get_height();

width_adjust = window_get_width()/1920;
height_adjust = window_get_height()/1080;

window_size_w = window_get_width();
window_size_h = window_get_height();

display_gui_w = display_get_gui_width();
display_gui_h = display_get_gui_height();

//view_width = window_get_width();
//view_height = window_get_height();
target_room = noone;
moved_room = false;
screen_saved = false;
prev_screenshot = noone;

//get screenshot of current surface
//prev_screen = noone;
//it can't seem to save elements drawn in gui layer to the sprite
//prev_screen = sprite_create_from_surface(application_surface,0,0,view_width,view_height,false, false, 0,0);


//screen_save("previous_screen.png");

//put in in front of everything
depth = -1000

finished = false;
transition_sprite = choose(spr_apple2_p1_imposter, spr_blueberry3_imposter, spr_banana2_p1_imposter, spr_lime2_p1_imposter, spr_orange_p1_imposter);
transition_sprite_array = [];

spd = 60;
rotate_spd = 4;
scale = 80;

sprite_width_buffer = sprite_get_width(transition_sprite)*scale;
sprite_height_buffer = sprite_get_height(transition_sprite)*scale;

//transition_type = LINE_BTT;
transition_type = choose(ROLL_LTR, ROLL_RTL, LINE_BTT, LINE_TTB);

switch(transition_type){
	
	case ROLL_RTL:
		//x = view_width +sprite_width_buffer;
		x = display_gui_w +sprite_width_buffer;
	break;
	case ROLL_LTR:
		x = 0 - sprite_width_buffer
	break;
	case LINE_TTB:
		scale = 13;
		spd = 30;
		sprite_height_buffer = sprite_get_height(transition_sprite)*scale;
		sprite_width_buffer = sprite_get_width(transition_sprite)*scale;
		
		//put data in
		for(var i=0; i < 20; i++){
			//get sprite
			transition_sprite_array[i,0] = choose(spr_apple2_p1_imposter, spr_blueberry3_imposter, spr_banana2_p1_imposter, spr_lime2_p1_imposter, spr_orange_p1_imposter);
			//get y offset
			transition_sprite_array[i,1] = irandom_range(-sprite_height_buffer/3, sprite_height_buffer/3);
			//get spin direction
			transition_sprite_array[i,2] = choose(-1,1);
		}	
		
		y = 0 - sprite_height_buffer;
	break;
	
	case LINE_BTT:
		scale = 13;
		spd = 30;
		sprite_height_buffer = sprite_get_height(transition_sprite)*scale;
		sprite_width_buffer = sprite_get_width(transition_sprite)*scale;
		
		//put data in
		for(var i=0; i < 20; i++){
			//get sprite
			transition_sprite_array[i,0] = choose(spr_apple2_p1_imposter, spr_blueberry3_imposter, spr_banana2_p1_imposter, spr_lime2_p1_imposter, spr_orange_p1_imposter);
			//get y offset
			transition_sprite_array[i,1] = irandom_range(-sprite_height_buffer/3, sprite_height_buffer/3);
			//get spin direction
			transition_sprite_array[i,2] = choose(-1,1);
		}	
		
		y = display_gui_h + sprite_height_buffer;
	
	break;
	
}




