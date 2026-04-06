/// @description Insert description here

if (knocked_out == true) exit;
if (obj_game.game_over == true) exit;

//if you're holding something
if (instance_holding_sprite_index != noone){
	
	//if you're holding something, switch to the player sprite that has the holding background
	if (player_holding_sprite_index != noone){
		sprite_index = player_holding_sprite_index;
	}
	//draw_sprite(instance_holding_sprite_index,0,x,y);
	
	draw_self();	
	//draw what you're holding
	//pick up, enlarge and make item slightly transparent
	draw_sprite_ext(instance_holding_sprite_index,instance_holding_image_index,x-1,y-1,1.1,1.1,0,c_white,.85);
	
}
else{
	if (player_regular_sprite_index != noone){
		sprite_index = player_regular_sprite_index;
	}
	draw_self();
}
