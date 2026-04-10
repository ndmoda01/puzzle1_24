/// @description Insert description here
var _w = display_get_gui_width();
var _h = display_get_gui_height();

var c = c_black;
draw_set_alpha(.9);
draw_rectangle_color(0,0,_w,_h,c,c,c,c,false);
draw_set_alpha(1);
//x+=1;
//y+=1;
//draw_sprite_tiled_ext(spr_banana2_p1,1,x,0,6,6,c_white,.5);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_game_gui_largest_3);
//var c = obj_game.color[4];
//draw_text_color((_w/2),(_h/2)-100,"Level "+string(my_level),c,c,c,c,1);
if (obj_game.game_type != BLOCKOUT) and (obj_game.game_type != COLOR_CLASH) draw_text(_w/2,(_h/2)-100,"Level "+string(my_level));
if (obj_game.game_type == BLOCKOUT) or (obj_game.game_type == COLOR_CLASH) draw_text(_w/2,(_h/2)-100,"Round "+string(my_level));

draw_set_font(fnt_game_gui_largest_2);
draw_text(_w/2,_h/2,my_text[text_index]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

timer--;
if (timer <= 0){
	
	//if you won't run out of entries, incriment
	if (text_index+1 < array_length(my_text)){
		text_index++;
		timer = timer_max;
	}
	//else destroy
	else instance_destroy();
}