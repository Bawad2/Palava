//Things to do when you are a text
if Text and instance_exists(global.selectedSkill)
{	
	detailText = global.selectedSkill.skillDetail;

}

if sprite and instance_exists(global.selectedSkill)
{
	detailSprite = global.selectedSkill.spriteHD
	sprite_index = detailSprite;
}


show_debug_message( string(detailSprite) + "," + string(detailText) )