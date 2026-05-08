/// @description Insert description here

//draw_sprite_ext(spr_explode_particle,0,x,y,image_xscale,image_yscale,image_angle,c_white,1);
draw_self();
draw_sprite_ext(spr_explode_particle,0,x,y,image_xscale,image_yscale,image_angle,c_white,cover_alpha);
//draw_text(x,y,string(move_speed));