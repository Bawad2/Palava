getControls();

//X movement
	//Direction
	moveDir = rightKey - leftKey;

	//get xspd
	
	xspd = moveDir * moveSpd;
	
	//X collisons
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_wall)
	{
		//scoot up to the wall
		var _pixelCheck = _subPixel * sign(xspd);
		
		while !place_meeting( x + _pixelCheck, y, obj_wall)
		{
			x += _pixelCheck;	
		}
		
		
		
		//STOP
		xspd = 0;
		
	}

//Y movement
	//grav
	yspd += grav;
	
	//Jump
	if jumpKeyPressed and place_meeting( x, y + 1, obj_wall)
	{
		yspd = jspd;
	}
	
	//Y collison
	
	if place_meeting( x, y + yspd, obj_wall)
	{
		
	//scoot up to the wall
		var _pixelCheck = _subPixel * sign(yspd);
		
		while !place_meeting( x , y + _pixelCheck, obj_wall)
		{
			y += _pixelCheck;	
		}
		
		yspd = 0;
		
	}
	




//MOVE
x += xspd;
y += yspd;