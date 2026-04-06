repeat(irandom_range(20,40)){
		var _part = instance_create_layer(x,y,"Instances_1",obj_explode_particle);
		_part.image_blend = my_color;
		_part.my_lifespan = irandom_range(40,60);
		_part.spd = random_range(1,1.2);
		_part.my_creator_id = id;
}



