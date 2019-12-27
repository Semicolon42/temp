var xx,yy,hud_width,hud_height,recoil_time,decay_count,decay_count_max,hud_width_step_width;
var decay_time,hud_decay_step,horizontal;
xx              = argument0
yy              = argument1
hud_width       = argument2
hud_height      = argument3
recoil_time     = argument4 // 0-1
decay_time      = argument5 // 0-1
decay_count     = argument6
decay_count_max = argument7
horizontal      = argument8

if(horizontal) {
	draw_rectangle(xx,yy,xx+hud_height,yy+1,false)

	yy += 3;
	draw_rectangle(xx,yy,xx+hud_height*recoil_time,yy+hud_width,false)

	yy += hud_width+1
	hud_decay_step = hud_height/max(decay_count_max,decay_count+1)
	for(i=0;i<=decay_count-1;i++) {
		draw_rectangle(xx+i*hud_decay_step,yy,
		               xx+(i+1)*hud_decay_step-3,yy+hud_width,false)
	}
	draw_rectangle(xx+decay_count*hud_decay_step,yy,
	               xx+(decay_count+decay_time)*hud_decay_step,yy+hud_width,false)
} else {
	draw_rectangle(xx,yy,xx+1,yy+hud_height,false)

	xx += 3;
	draw_rectangle(xx,yy,xx+hud_width,yy+hud_height*recoil_time,false)

	xx += hud_width+1
	hud_decay_step = hud_height/max(decay_count_max,decay_count+1)
	for(i=0;i<=decay_count-1;i++) {
		draw_rectangle(xx,yy+i*hud_decay_step,
		               xx+hud_width,yy+(i+1)*hud_decay_step-3,false)
	}
	draw_rectangle(xx,yy+decay_count*hud_decay_step,
	               xx+hud_width,yy+(decay_count+decay_time)*hud_decay_step,false)
}
	