//bounce up and down
t ++

y = y + dsin( freq *(t mod 360))*amp


//add money to player
if place_meeting( x, y, obj_Player) { global.Coins += value; instance_destroy(); }