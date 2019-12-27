/// @description Insert description here
// You can write your code in this editor
ctrl_left  = vk_left
ctrl_right = vk_right
ctrl_up    = vk_up
ctrl_down  = vk_down
ctrl_boost = ord("Z")
ctrl_shoot = ord("X")
_left_pressed  = keyboard_check_pressed(ctrl_left)
_right_pressed = keyboard_check_pressed(ctrl_right)
_up_pressed    = keyboard_check_pressed(ctrl_up)
_down_pressed  = keyboard_check_pressed(ctrl_down)
_shoot_pressed = keyboard_check_pressed(ctrl_shoot)
_boost_pressed = keyboard_check_pressed(ctrl_boost)
_left  = keyboard_check(ctrl_left)
_right = keyboard_check(ctrl_right)
_up    = keyboard_check(ctrl_up)
_down  = keyboard_check(ctrl_down)
_shoot = keyboard_check(ctrl_shoot)
_boost = keyboard_check(ctrl_boost)
image_speed=0



////////////////////////////////////////
////////////////////////////////////////

// Math needed by later calculations
dir=point_direction(0,0,x_speed,y_speed)
cos_dir = cos( dir / 180 * pi)
sin_dir = sin((dir + 180) / 180 * pi)
max_x = max_speed * cos_dir
max_y = max_speed * sin_dir
cos_facing = cos( image_angle / 180 * pi)
sin_facing = sin((image_angle + 180) / 180 * pi)

////////////////////////////////////////
////////////////////////////////////////

// Handle Boost logic and controls
if (boost_time > 0) { boost_time-=1 }
if (boost_recoil_time > 0) { boost_recoil_time-=1 }
if (boost_decay_time>0) { boost_decay_time-=1; }
else if(boost_decay_count >0) {boost_decay_count-=1; boost_decay_time=boost_decay_time_max}

if (_boost_pressed and boost_recoil_time <= 0) {
	if (_up) {
		x_speed   += accel_boost_speed * cos_facing
		y_speed   += accel_boost_speed * sin_facing
		
	} else if (_down) {
		x_speed *= brake_boost
		y_speed *= brake_boost
	}
	
	if (boost_decay_time > 0) boost_decay_count += 1
	boost_decay_time = boost_decay_time_max
	boost_time = boost_time_max
	boost_recoil_time = boost_time_max + boost_decay_count * boost_decay_span
	boost_recoil_time_max = boost_time_max + boost_decay_count * boost_decay_span
}

////////////////////////////////////////
////////////////////////////////////////

// Apply controls
if(_right) {
	image_angle -= rotate_speed + (boost_time>0 ? boost_time/boost_time_max * rotate_boost : 0)
}
if(_left) {
	image_angle += rotate_speed + (boost_time>0 ? boost_time/boost_time_max * rotate_boost : 0)
}


if(_up) {
	if (cos_facing*x_speed <= 0 or abs(x_speed) < abs(max_x)) x_speed += accel * cos_facing
	if (sin_facing*y_speed <= 0 or abs(y_speed) < abs(max_y)) y_speed += accel * sin_facing
} else if(_down) {
	x_speed *= brake
	y_speed *= brake
	if(abs(x_speed) <= accel) x_speed = 0
	if(abs(y_speed) <= accel) y_speed = 0
}

////////////////////////////////////////////
////////////////////////////////////////////
// Handle Screen Wrap
space = sprite_width / 2
if(x < 0 - space)           x = room_width + space - 1
if(x > room_width + space)  x = - space + 1
if(y < 0 - space)           y = room_height + space - 1
if(y > room_height + space) y = - space + 1

// Natural Braking when above max speed
diff_x = max(abs(x_speed)-abs(max_x), 0)
diff_y = max(abs(y_speed)-abs(max_y), 0)
//diff_y = abs(y_speed) > abs(max_y) ? abs(y_speed)-abs(max_y) : 0
if (diff_x > 0) x_speed -= sign(x_speed) * brake_natural * diff_x
if (diff_y > 0) y_speed -= sign(y_speed) * brake_natural * diff_y

x += x_speed
y += y_speed



////////////////////////////////////////////
////////////////////////////////////////////

if(_shoot_pressed and bullet == noone) {
     bullet = instance_create_depth(x,y, -1, obj_bullet)	
	 bullet.direction = image_angle
	 bullet.speed = bullet_speed
	 bullet.life = bullet_life
	 bullet.ship = self
}