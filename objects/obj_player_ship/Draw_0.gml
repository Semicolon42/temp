/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_color(c_white)

draw_player_hud(5,5,5,50,
                boost_recoil_time/boost_recoil_time_max,
                boost_decay_time/boost_decay_time_max,
				boost_decay_count,6,
				true)

/**
var xx,yy;
var hud_width_max,hud_width_step_count,hud_width_step_width;
hud_width_max = 200

xx = 30
yy = 4;

draw_rectangle(xx,yy,xx+hud_width_max,yy+10,false)

yy = 11;
draw_rectangle(xx,yy,xx+hud_width_max*boost_recoil_time/boost_recoil_temp_max,yy+10,false)



yy += 11
hud_width_step_count = max(6,boost_decay_count+1)
hud_width_step_width = hud_width_max/hud_width_step_count
for(i=0;i<=boost_decay_count-1;i++) {
	draw_rectangle(xx+i*hud_width_step_width,yy,xx+(i+1)*hud_width_step_width-3,yy+10,false)
}
draw_rectangle(xx+boost_decay_count*hud_width_step_width,yy,
               xx+(boost_decay_count+boost_decay_time/boost_decay_time_max)*hud_width_step_width,yy+10,false)

yy += 20; draw_rectangle(xx,yy,xx+x_speed*2,yy+10,false)
yy += 15; draw_rectangle(xx,yy,xx+max_x*2  ,yy+10,false)

yy += 20; draw_rectangle(xx,yy,xx+y_speed*2,yy+10,false)
yy += 15; draw_rectangle(xx,yy,xx+max_y*2,yy+10,false)

**/