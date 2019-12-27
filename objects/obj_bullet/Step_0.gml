/// @description Insert description here
// You can write your code in this editor
life -= 1
if(life <= 0) {
    instance_destroy()
	ship.bullet = noone
}

// Handle Screen Wrap
space = width / 2
if(x < 0 - space)           x = room_width + space - 1
if(x > room_width + space)  x = - space + 1
if(y < 0 - space)           y = room_height + space - 1
if(y > room_height + space) y = - space + 1