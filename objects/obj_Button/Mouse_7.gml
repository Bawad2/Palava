


switch (Button_ID)
{
	case 0 :

		//Game start button
if room != rm_test
{
	room = rm_test;
	layer_set_visible("MainMenu", false)
}
		
	break;
	
	case 1:
		//restart button
	 layer_set_visible("GameOverScreen", false ); 
	 obj_Player.Hp = obj_Player.HpMax;
	
	
	break;
	
}