/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_color(c_white)

var xx,yy;
var wwww,_ww;
wwww = 200

xx = 30
yy = 4;

draw_rectangle(xx,yy,xx+wwww,yy+10,false)

yy = 11;
draw_rectangle(xx,yy,xx+wwww*boost_recoil_time/boost_recoil_temp_max,yy+10,false)



yy += 11
_span = max(6,boost_decay_count+1)
_ww = wwww/_span
for(i=0;i<=boost_decay_count-1;i++) {
	draw_rectangle(xx+i*_ww,yy,xx+(i+1)*_ww-3,yy+10,false)
}
draw_rectangle(xx+boost_decay_count*_ww,yy,
               xx+(boost_decay_count+boost_decay_time/boost_decay_time_max)*_ww,yy+10,false)

yy += 20; draw_rectangle(xx,yy,xx+x_speed*2,yy+10,false)
yy += 15; draw_rectangle(xx,yy,xx+max_x*2  ,yy+10,false)

yy += 20; draw_rectangle(xx,yy,xx+y_speed*2,yy+10,false)
yy += 15; draw_rectangle(xx,yy,xx+max_y*2,yy+10,false)