/// @description Insert description here

if (place_meeting(x,y,obj_player_background_parent)){ 
	var _inst = instance_place(x,y,obj_player_background_parent);
	instance_destroy(_inst);
}