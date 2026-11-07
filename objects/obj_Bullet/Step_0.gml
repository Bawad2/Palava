

//fly towards the player
move_towards_point(  obj_Player.x, obj_Player.y - 10, moveSpd )






#endregion


x += xspd;
y += yspd;

//die if you touch a wall
//if place_meeting( x, y, obj_wall ) { instance_destroy(); }

//hurt the player and die
if place_meeting( x, y, obj_Player ) { obj_Player.Hp -= Dmg; instance_destroy(); }
