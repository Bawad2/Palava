getControls();

//X movement
#region
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

#endregion
//Y movement
#region
	//grav
	yspd += grav;
	
	//reset jump variables
	if onGround { jumpCount = 0; jumpHoldTimer = 0; } else { if jumpCount == 0 { jumpCount = 1; }  }
	
	
	//initaite the Jump
	if jkeybufferd and jumpCount < jumpMax
	{	
		//reset buffer
		jkeybufferd = 0;
		jkeybuffertimer = 0;
		
		//increse the number of jumps performed
		jumpCount ++;
		
		
		//jump
		jumpHoldTimer = jumpHoldFrames[jumpCount - 1];
	}
	
	if !jumpKey { jumpHoldTimer = 0; }
	
	//jump if the holdtimer is running
	if jumpHoldTimer > 0
	{
		yspd = jspd
		jumpHoldTimer --;
	} 
	
	
	//quickfall
	
	if downKey { yspd += 1; }
	
	
	//Y collison
	if yspd > termVel {  yspd = termVel;}
	
	if place_meeting( x, y + yspd, obj_wall)
	{
		
	//scoot up to the wall
		var _pixelCheck = _subPixel * sign(yspd);
		
		while !place_meeting( x , y + _pixelCheck, obj_wall)
		{
			y += _pixelCheck;	
		}
		
		yspd = 0;
		jumpHoldTimer = 0;
		
	}
	
	//set if im on the ground
	
	if yspd >= 0 and place_meeting( x, y + 1, obj_wall) {  onGround = true} else{ onGround = false; }


#endregion

//MOVE
x += xspd;
y += yspd;