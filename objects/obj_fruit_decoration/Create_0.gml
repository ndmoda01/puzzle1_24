/// @description Insert description here

spin_speed = choose(1,-1);
image_speed = 0;

var _type = irandom_range(1,5);

switch(_type){
			
	case BANANA: _type = obj_banana;
			sprite_index = spr_banana2_p1_imposter;
	break;
			
	case APPLE: _type = obj_apple;
			sprite_index = spr_apple2_p1_imposter;

	break;
			
	case LIME: _type = obj_lime;
			sprite_index = spr_lime2_p1_imposter;

	break;
			
	case BLUEBERRY: _type = obj_blueberry;
			sprite_index = spr_blueberry4_imposter;

	break;
			
	case ORANGE: _type = obj_orange;
			sprite_index = spr_orange_p1_imposter;

	break;
	

}	

image_xscale = 2;
image_yscale = image_xscale;