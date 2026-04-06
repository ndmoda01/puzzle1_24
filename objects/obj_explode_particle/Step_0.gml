x = x+lengthdir_x(spd,direction);
y = y+lengthdir_y(spd,direction);


my_lifespan--;


//fade out
if (my_lifespan < 10){
	image_alpha = (my_lifespan)*.1;	
}

if (my_lifespan <= 0) instance_destroy();