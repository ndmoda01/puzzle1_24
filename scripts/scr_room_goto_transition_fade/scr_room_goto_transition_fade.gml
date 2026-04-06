function scr_room_goto_transition_fade(_target_room){
	
	if (!instance_exists(obj_room_transition)) or (!instance_exists(obj_room_transition_fade)){
		var _transition = instance_create_depth(x,y,-1000,obj_room_transition_fade);
		_transition.target_room = _target_room;
	}

}