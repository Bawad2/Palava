function conSetup(){
	
	buffertime = 3;
	
	jkeybufferd = 0;
	jkeybuffertimer = 0;
}

function getControls(){
	//directional inputs
	rightKey		= keyboard_check(vk_right) + keyboard_check(ord("D")) + gamepad_button_check( 0, gp_padr );
	rightKey		= clamp( rightKey, 0, 1);
	leftKey			= keyboard_check(vk_left) + keyboard_check(ord("A")) +  gamepad_button_check( 0, gp_padl );
	leftKey			= clamp( leftKey, 0, 1);
	upKey			= keyboard_check(vk_up) + keyboard_check(ord("W")) + gamepad_button_check( 0, gp_padu );
	upKey			= clamp(upKey, 0, 1);
	downKey			= keyboard_check(vk_down) + keyboard_check(ord("S")) + gamepad_button_check( 0, gp_padd );
	downKey			= clamp( downKey, 0, 1);
	//Action inputs
	jumpKey			= keyboard_check(vk_space) + keyboard_check(ord("W")) + gamepad_button_check( 0, gp_face1 )
	jumpKeyPressed  = keyboard_check_pressed(vk_space) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed( 0, gp_face1)
	mb1				= mouse_check_button_released(mb_right);
	mb2				= mouse_check_button_released(mb_left);
	mbM				= mouse_check_button_released(mb_middle);
	anyKey			= keyboard_check(vk_anykey) || mouse_check_button_released(mb_any);
	killButton		= keyboard_check_pressed( vk_delete ) || gamepad_button_check_released( 0 , gp_start )
	//key buffering
	if jumpKeyPressed		{ jkeybuffertimer = buffertime; };
	if jkeybuffertimer > 0	{ jkeybufferd = 1; jkeybuffertimer--;  } else { jkeybufferd = 0; }
}
