///@arg attack_player
///@arg attack_player
///@arg attack_player

function scr_apply_power_frozen(argument0,argument1,argument2){
	
	var _enemy_1 = argument0;
	var _enemy_2 = argument1;
	var _enemy_3 = argument2;
	
	
	switch(obj_game.number_of_players){
		
		case 2:
			_enemy_1.frozen = true;
			_enemy_1.alarm[0] = 5*SEC;
		break;
			
		case 3:
			_enemy_1.frozen = true;
			_enemy_1.alarm[0] = 4*SEC;
			_enemy_2.frozen = true;
			_enemy_2.alarm[0] = 4*SEC;
		break;
		
		case 4:
			_enemy_1.frozen = true;
			_enemy_1.alarm[0] = 3*SEC;
			_enemy_2.frozen = true;
			_enemy_2.alarm[0] = 3*SEC;
			_enemy_3.frozen = true;
			_enemy_3.alarm[0] = 3*SEC;
		break;
	}
}