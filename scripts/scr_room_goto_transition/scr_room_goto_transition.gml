///@arg target_room
function scr_room_goto_transition(argument0){
	var _target_room = argument0;
	
	//turn off background to prevent stutter appearance
	//var _back_1, _back_2, _back_3;
	//if (layer_exists("Effect_1")){
	//	_back_1 = layer_get_id("Effect_1");	
	//	layer_set_visible(_back_1,false);
	//}
	//if (layer_exists("Effect_2")){
	//	_back_2 = layer_get_id("Effect_2");	
	//	layer_set_visible(_back_2,false);
	//}
	//if (layer_exists("Effect_3")){
	//	_back_3 = layer_get_id("Effect_3");	
	//	layer_set_visible(_back_3,false);
	//}
	
	//check to make sure there isn't already a transition going on
	if (!instance_exists(obj_room_transition)){
		var _transition = instance_create_depth(x,y,-1000,obj_room_transition);
		_transition.target_room = _target_room;
	}

}