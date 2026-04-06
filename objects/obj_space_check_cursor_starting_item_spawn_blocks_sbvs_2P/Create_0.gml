//inner box growing larger max
//3 space buffer on all sides
max_blocks_1_player = 10;
max_blocks_2_player = 39;
max_blocks_2_player_sbvs = 36;
max_blocks_3_player = 90;
max_blocks_4_player = 260;

//get the max blocks for the current game
var _max_blocks = 0;
switch(obj_game.number_of_players){
	case 1: _max_blocks = max_blocks_1_player; break;
	
	case 2: 
		if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP)  _max_blocks = max_blocks_2_player_sbvs;
		else _max_blocks = max_blocks_2_player; 
	break;
	
	case 3: _max_blocks = max_blocks_3_player; break;
	case 4: _max_blocks = max_blocks_4_player; break;
	
}
var _num_of_starting_blocks = obj_game.level_starting_blocks_sbvs_2p;
//cap off off the max blocks
if (_num_of_starting_blocks > _max_blocks) _num_of_starting_blocks = _max_blocks;

//determine start block x location
//location will adjust based on the number of blocks so that lines spawn evenly and adjusted if needed based on block qty
switch(obj_game.number_of_players){
	case 1:
		//no adjustment for 1 player, only has 1 line that won't move (max 10 blocks)
	break;
	case 2:
		//this is the only option that is relevant for this object right now
		if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP){
			if (instance_exists(obj_space_check_start_block)){
				//3 row buffer on each side makes max line of blocks 18 long
				if (_num_of_starting_blocks <=12) obj_space_check_start_block_sbvs_2p.y = 160;	
				if (_num_of_starting_blocks >12)  and (_num_of_starting_blocks <=24) obj_space_check_start_block_sbvs_2p.y = 144;	
				if (_num_of_starting_blocks >24) and (_num_of_starting_blocks <=36) obj_space_check_start_block_sbvs_2p.y = 128;	
			}
		}
		else{
			if (instance_exists(obj_space_check_start_block)){
				//3 row buffer on each side makes max line of blocks 13 long
				if (_num_of_starting_blocks <=13) obj_space_check_start_block.y = 144;	
				if (_num_of_starting_blocks >13)  and (_num_of_starting_blocks <=39) obj_space_check_start_block.y = 128;	
			}
		}
	break;
	case 3:
		if (instance_exists(obj_space_check_start_block)){
			//3 row buffer on each side makes max line of blocks 18 long
			if (_num_of_starting_blocks <=18) obj_space_check_start_block.y = 160;	
			if (_num_of_starting_blocks >18)  and (_num_of_starting_blocks <=54) obj_space_check_start_block.y = 144;	
			if (_num_of_starting_blocks >54) and (_num_of_starting_blocks <=90) obj_space_check_start_block.y = 128;	
		}
	break;
	case 4:
		if (instance_exists(obj_space_check_start_block)){
			//3 row buffer on each side makes max line of blocks 26 long
			if (_num_of_starting_blocks <=52) obj_space_check_start_block.y = 160;	
			if (_num_of_starting_blocks >52)  and (_num_of_starting_blocks <=130) obj_space_check_start_block.y = 144;	
			if (_num_of_starting_blocks >130) and (_num_of_starting_blocks <=182) obj_space_check_start_block.y = 128;	
			if (_num_of_starting_blocks >182) and (_num_of_starting_blocks <=234) obj_space_check_start_block.y = 112;	
			if (_num_of_starting_blocks >234) and (_num_of_starting_blocks <=260) obj_space_check_start_block.y = 96;		
		}
	break;
}

start_x = obj_space_check_start_block_sbvs_2p.x;
start_y = obj_space_check_start_block_sbvs_2p.y;
x = start_x;
y = start_y;

move_amount = 16;
free_space = [];

//run through each row to see if space is free, 
var _row_number = 1;
var _free_space_index = 0;

while(!place_meeting(x,y,obj_space_check_stop_block)){

	//check to see if you're at the end of the line
	if (place_meeting(x,y,obj_space_check_wall_block)){
		
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

//cap off the max spaces
if (_num_of_starting_blocks > _num_of_free_spaces) _num_of_starting_blocks = _num_of_free_spaces;

//finish spot
//code will only run once bc it's in a create event
if (place_meeting(x,y,obj_space_check_stop_block)){
	
	var i = 0;
	//make the number of instances specified in the level variables
	repeat(_num_of_starting_blocks){
	
		//spawn the instance and increase the counter
		var _starting_item = instance_create_layer(free_space[i,0],free_space[i,1],"Instances_1",obj_block);
		_starting_item.my_player_board = 2;
		
		i++;
		
	}
	//destroy yourself
	instance_destroy();
}