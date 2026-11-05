//custom function
function setOnGround( _val = true) 
{
	if (_val = true)
	{
		onGround = true
		CoyoteHangTimer = CoyoteHangFrames;
	} else
	{
		onGround = false;
		CoyoteHangTimer = 0;
	}
	
			
}

conSetup();



//spites
#region
MaskSprite = spr_Playeridle;
sIdle = spr_Playeridle;
sRunning = spr_PlayerRun;
sWalk = spr_PlayerWalk;
sJumping = spr_PlayerJump;
#endregion

//movement
#region
face = 1;
moveDir = 0;
runtype = 0;
moveSpd[0] = 2;
moveSpd[1] = 5;
xspd = 0;
yspd = 0;

//Dash
Dashed = 0;
DashPwr = 20;


#endregion

//jumping
#region
grav = .775
termVel = 50;
jspd = -6.15;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 10;
jumpHoldFrames[1] = 5;
onGround = false;

//coyote time
//hang time
CoyoteHangFrames = 2;
CoyoteHangTimer = 0;

//jumptime
CoyoteJumpFrames = 15;
CoyoteJumpTimer = 0;
#endregion


//Shop stuff
Coins = global.Coins


//Upgrades
uprgadeDash = 0;
uprgadeAirdash = 0;
uprgadeDoubleJump = 0;
upgradeCrouch = 0;
upgradeGun = 0;



//STATES
previousState = stateFree();

stateFree = function stateFree()
{
	getControls();
	
	//Change states
	if (keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_shoulderrb)) and onGround { state = stateDash; }
	
	
	
	//X movement
#region
	//Direction
	moveDir = rightKey - leftKey;
	if moveDir == 0 { moveDir = GPleftH }
	//get face
	if moveDir != 0 { face = moveDir}
	//run if runkey

	
	//run when dash has ended
	if shiftkey  { runtype = 1; } else { runtype = 0; }
	
	//get xspd
	
	xspd = moveDir * moveSpd[runtype]; 
	
	//X collisons
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_wall)
	{
		
		//check for slopes
		if !place_meeting( x + xspd, y - abs(xspd)*2 - 3, obj_wall)
		{
			setOnGround()
			while place_meeting( x + xspd, y , obj_wall) {  y -= _subPixel; }
		} 
		//regular collison if no slop but first celling
		
		else
		{
			//celling check
			if !place_meeting(x + xspd, y + abs(yspd) + 2, obj_wall) 
			{
				while place_meeting( x + xspd, y , obj_wall) { y += 1; }
			} 
		//normal
		else {
			
		//scoot up to the wall
		var _pixelCheck = _subPixel * sign(xspd);
		
		
		while !place_meeting( x + _pixelCheck, y, obj_wall)  {	x += _pixelCheck;  }
			
		//STOP
		xspd = 0;
			}
		}
	}

//go down slopes
if yspd >= 0 and !place_meeting( x + xspd, y + 1, obj_wall) and place_meeting( x + xspd, y + abs(xspd) + 1, obj_wall)
{
	while !place_meeting( x + xspd, y + 1, obj_wall) { y += 1; }
}



#endregion
//Y movement
#region
	//grav
	if CoyoteHangTimer > 0
	{
		CoyoteHangTimer --;
	} else {
	yspd += grav;
	setOnGround( false )
	}
	//reset jump variables
	if onGround 
	{
		jumpCount = 0; 
		jumpHoldTimer = 0;
		CoyoteJumpTimer = CoyoteJumpFrames;
	} else { 
		
		CoyoteJumpTimer--;
		if jumpCount == 0 and CoyoteJumpTimer <= 0 { jumpCount = 1; }  
		
		}
	
	
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
		
		//your ahh is not on the ground
		setOnGround(false)
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
	
	if yspd >= 0 and ( place_meeting( x, y + 1, obj_wall) or place_meeting( x + 2, y + 1, obj_wall) ) { setOnGround() }


#endregion

//sprite updating

#region



if abs(xspd) > 0  { sprite_index = sWalk;  } else { sprite_index = sIdle;  };
if abs(xspd) >= moveSpd[1] { sprite_index = sRunning; }
if !onGround { sprite_index = sJumping } 

//set collisons
	mask_index = MaskSprite;
#endregion

//MOVE
x += xspd;
y += yspd;
}
stateDash = function stateDash() 
{

if Dashed == 0 { sprite_index = spr_PlayerDashLaunch; state = stateAnimating; previousState = stateDash; }	
	
//get face
xspd += 3*face
Dashed += 3


//collisons
//X collisons
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_wall)
	{
		
		//check for slopes
		if !place_meeting( x + xspd, y - abs(xspd)*2 - 3, obj_wall)
		{
			setOnGround()
			while place_meeting( x + xspd, y , obj_wall) {  y -= _subPixel; }
		} 
		//regular collison if no slop but first celling
		
		else
		{
			//celling check
			if !place_meeting(x + xspd, y + abs(yspd) + 2, obj_wall) 
			{
				while place_meeting( x + xspd, y , obj_wall) { y += 1; }
			} 
		//normal
		else {
			
		//scoot up to the wall
		var _pixelCheck = _subPixel * sign(xspd);
		
		
		while !place_meeting( x + _pixelCheck, y, obj_wall)  {	x += _pixelCheck;  }
			
		//STOP
		xspd = 0;
			}
		} Dashed = DashPwr;
	}
	
	
	x += xspd;
	
	if Dashed >= DashPwr { state = stateFree; Dashed = 0  }

}
statePlayingAnimation = function stateAnimating()
{
if (image_index >= image_number - sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) {
    state = previousState;
}
}




state = stateFree;

