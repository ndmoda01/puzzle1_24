start_x = obj_space_check_start_sbvs_2p.x;
start_y = obj_space_check_start_sbvs_2p.y;
x = start_x;
y = start_y;

move_amount = 16;

free_space = [];

//run through each row to see if space is free, to make the free space array
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
var _level_color_block_percent = .4;
var _num_of_starting_blocks_color = round(_num_of_starting_items*_level_color_block_percent);

//shuffle the empty spaces array
array_shuffle_ext(free_space);

//finish spot
//code will only run once bc it's in a create event
if (place_meeting(x,y,obj_space_check_stop)){
	
	var i = 0;
	//make the number of instances specified in the level variables
	repeat(_num_of_starting_blocks_color){
	
		//determine type
		switch(obj_game.level_item_selection_pool_qty){
			case 3:
				my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2]);
			break;
			case 4:
				my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2], obj_game.level_item_selection_pool[3]);
			break;	
		}
		
	
		//spawn the block instance, set the color and player board and increase the counter
		var _starting_blocks_color = instance_create_layer(free_space[i,0],free_space[i,1],"Instances_1",obj_rock_color);
		//set the block color
		_starting_blocks_color.image_index = my_type-1;
		_starting_blocks_color.my_player_board = 2;
		
		i++;
		
	}
	//destroy yourself
	instance_destroy();
}