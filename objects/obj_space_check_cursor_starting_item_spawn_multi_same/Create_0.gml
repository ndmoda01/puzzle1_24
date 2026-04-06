start_x = obj_space_check_start.x;
start_y = obj_space_check_start.y;
x = start_x;
y = start_y;

move_amount = 16;

free_space = [];

//run through each row to see if space is free, 
var _row_number = 1;
var _free_space_index = 0;

while(!place_meeting(x,y,obj_space_check_stop)){

	//check to see if you're at the end of the line
	if (place_meeting(x,y,obj_space_check_wall)){
		
		//return back to the start x, and ofset y
		x = start_x;
		y = start_y+(move_amount*_row_number);
		
		//increase row number
		_row_number++;
	}
	
	//check to see if something is there
	if (place_free(x,y)){
		//add your position to an array
		free_space[_free_space_index] = [x,y];
		_free_space_index++;
	}
	
	//move
	x += move_amount;
}

//starting item number generate
var _num_of_free_spaces = array_length(free_space);
var _num_of_starting_items = round(_num_of_free_spaces*obj_game.level_item_percent_full);

//shuffle the array
array_shuffle_ext(free_space);

//finish spot
//code will only run once bc it's in a create event
if (place_meeting(x,y,obj_space_check_stop)){
	
	var i = 0;
	//make the number of instances specified in the level variables
	repeat(_num_of_starting_items){
	
		//determine type
		switch(obj_game.level_item_selection_pool_qty){
			case 3:
				my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2]);
			break;
			case 4:
				my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2], obj_game.level_item_selection_pool[3]);
			break;	
		}
		
		var _type = noone;
		switch(my_type){
			case BANANA: _type = obj_banana;
			break;
			case APPLE: _type = obj_apple;
			break;
			case LIME: _type = obj_lime;
			break;
			case BLUEBERRY: _type = obj_blueberry;
			break;
			case ORANGE: _type = obj_orange;
			break;
		}	
			
		//spawn the instance and increase the counter
		var _starting_item = instance_create_layer(free_space[i,0],free_space[i,1],"Instances_1",_type);
		_starting_item.my_player_board = 1;
		i++;
		
	}
	//destroy yourself
	instance_destroy();
}