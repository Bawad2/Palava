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
DashTimer = 0;
Dashing = 0;


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
