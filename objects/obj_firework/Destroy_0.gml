var _exp = choose(snd_firework_1, snd_firework_2, snd_firework_3);
var _gain = random_range(.5,1.5);
var _pitch = random_range(.5,1.5);
audio_play_sound(_exp,1,false,_gain,0,_pitch);

repeat(irandom_range(20,40)){
		var _part = instance_create_layer(x,y,"Instances_1",obj_explode_particle);
		_part.image_blend = my_color;
		_part.my_lifespan = irandom_range(40,60);
		_part.move_speed = random_range(1,1.2);
		_part.my_creator_id = id;
		_part.image_xscale = choose(.5,1);
		_part.image_yscale = _part.image_xscale;
}



