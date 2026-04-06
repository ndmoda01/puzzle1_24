function scr_increase_player_items_queued(_player_number, _item_qty){
	
	//increase garbage in blockout
	if (obj_game.game_type == BLOCKOUT) _item_qty +=1;

	switch(_player_number){
		case 1:
			if (instance_exists(obj_item_spawner_sbvs_2p)){
				obj_item_spawner_sbvs_2p.player2_queued_items += _item_qty;
			}
		break;
		
		case 2:
			if (instance_exists(obj_item_spawner)){
				obj_item_spawner.player1_queued_items += _item_qty;
			}
		break;
		
		
		
		
	}



}