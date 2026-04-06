my_text = "Main Menu";
my_text_x_offset = 22;
my_text_2 = "Return to the main menu." 

selectable = true;

activate_button = function(){
	//instance_create_depth(x,y,-1000,obj_room_transition);
	//room_goto(rm_main_menu);
	scr_room_goto_transition(rm_main_menu);

}