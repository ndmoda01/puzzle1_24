has_control = true;
key_left = 0;
key_right = 0;
key_up = 0;
key_down = 0;
key_select = 0;
key_run = 0;
key_left_held = 0;
key_right_held = 0;
key_up_held = 0;
key_down_held = 0;

move_amount = 16;
movement_manager = 0;

//amount of frames that need to pass before the next move can be made (higher number = slower movement)
regular_movement_rate = 12;
fast_movement_rate = 5;
movement_timer = regular_movement_rate;
h_move = 0;
v_move = 0;

holding = false;
instance_holding_id = noone;
instance_holding_sprite_index = noone;
instance_holding_image_index = noone;
instance_holding_type = noone;

player_regular_sprite_index = noone;
player_holding_sprite_index = noone;

instance_holding_id_temp = noone;

collection_grid = ds_grid_create(40,4);
level_collection_min = 3;
number_of_collections = 0;
highest_score_collection_instance = 0;

//hold instance id for horizontal collection
horizontal_collection_id = [];
horizontal_collection_qty = 1;

vertical_collection_id = [];
vertical_collection_qty = 1;

diagonal_fs_collection_id = [];
diagonal_fs_collection_qty = 1;

diagonal_bs_collection_id = [];
diagonal_bs_collection_qty = 1;

total_collection_qty = 0;

//this array will hold various details about the collections that might want to be referenced later
collection_details_array = [];
collection_details_index = 0;
for (var i = 0; i <100; i++){
	collection_details_index = i;
	collection_details_array[collection_details_index][TOTAL_QTY] = 0;
	collection_details_array[collection_details_index][DBASD_QTY] = 0;
	collection_details_array[collection_details_index][DBASU_QTY] = 0;
	collection_details_array[collection_details_index][DFRSD_QTY] = 0;
	collection_details_array[collection_details_index][DFRSU_QTY] = 0;
	collection_details_array[collection_details_index][VRTDO_QTY] = 0;
	collection_details_array[collection_details_index][VRTUP_QTY] = 0;
	collection_details_array[collection_details_index][HRZLE_QTY] = 0;
	collection_details_array[collection_details_index][HRZRI_QTY] = 0;
	collection_details_array[collection_details_index][DBAST_QTY] = 0;
	collection_details_array[collection_details_index][DFRST_QTY] = 0;
	collection_details_array[collection_details_index][VERTT_QTY] = 0;
	collection_details_array[collection_details_index][HORZT_QTY] = 0;
}
collection_details_index = 1;

player_number = 1;

currently_frozen = false;
knocked_out = false;

scoring_qty_hl = 0;
scoring_qty_hr = 0;
scoring_qty_vu = 0;
scoring_qty_vd = 0;
