move_amount = 16;

//outer perimiter moving in max
max_blocks_1_player = 76;
max_blocks_2_player = 132;
max_blocks_3_player = 216;
max_blocks_4_player = 452;

//inner box growing larger max
//3 space buffer on all sides
//max_blocks_1_player = 10;
//max_blocks_2_player = 39;
//max_blocks_3_player = 90;
//max_blocks_4_player = 260;

//get the max blocks for the current game
var _max_blocks = 0;
switch(obj_game.number_of_players){
	case 1: _max_blocks = max_blocks_1_player; break;
	case 2: _max_blocks = max_blocks_2_player; break;
	case 3: _max_blocks = max_blocks_3_player; break;
	case 4: _max_blocks = max_blocks_4_player; break;
	
}

start_x = obj_space_check_start.x;
start_y = obj_space_check_start.y;

//offset the first space so you don't start in a wall
x = start_x+16;
y = start_y;

free_space = [];
//free_space = array_create(obj_game.level_starting_blocks+1);

//run through each row to see if space is free, 
//var _row_number = 1;
var _free_space_index = 0;

var _direction = 0;
var _loop_count = 1;

//spawn the amount of blocks that have spawned so far up until the max
var _num_starting_blocks = min(_max_blocks, obj_game.level_starting_blocks);
//code will only run once bc it's in a create event
//create the blocks at the registered locations
var i = 0;

//block values are registered on the 2nd pass through the loop, so an additional time through the loop is needed to get the last coordinate
repeat(_num_starting_blocks){
	
	//check to see if you're at the end of the line
	if (place_meeting(x,y,obj_wall)) or (place_meeting(x,y,obj_block)){
		//these blocks don't exist yet to incriment the loop
		//if (place_meeting(x,y,obj_block)){_loop_count++;}
		
		//if you hit a wall, adjust and change directions
		switch(_direction){
			//hit a wall to the right, turn down
			case 0:
				x = x - move_amount*_loop_count;
				y = y + move_amount;
				_direction++;
			break;
			case 1:
			//hit a wall going down, turn left
				x = x - move_amount;
				y = y - move_amount*_loop_count;
				_direction++;
			break;
			case 2:
			//hit a wall going left, turn up
				x = x + move_amount*_loop_count;
				y = y - move_amount;
				_direction++;
			break;
			case 3:
			//hit a wall going up, turn right
				x = x + move_amount;
				y = y + move_amount*_loop_count;
				_direction = 0;
			break;
		}
		
	}
	
	//check to see if something is there
	if (place_free(x,y)){
		//add your position to an array
		//free_space[_free_space_index] = [x,y];
		//_free_space_index++;
		
		var _type = noone;
		_type = obj_block;
		obj_game.level_starting_blocks--;
		//spawn the instance and increase the counter
		var _starting_item = instance_create_layer(x,y,"Instances_1",_type);
		
	}
	
	//move
	switch(_direction){
		case 0:
			//movement right
			x = x + move_amount;
		break;
		case 1:
			//movement down
			y = y + move_amount;
		break;
		case 2:
			//movement left
			x = x - move_amount;
		break;
		case 3:
			//movement up
			y = y - move_amount;
		break;
	}
	
	
	//var _type = noone;
	//_type = obj_block;
	//obj_game.level_starting_blocks--;
	////spawn the instance and increase the counter
	//var _starting_item = instance_create_layer(free_space[i,0],free_space[i,1],"Instances_1",_type);
			
	//i++;
}






//destroy yourself
instance_destroy();
