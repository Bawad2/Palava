draw_text( 120, 200, GPleftH);

//Calculation for the sprite

var HpPercent = Hp / HpMax;
HpPercent = clamp(HpPercent, 0, 1);

draw_sprite_ext( spr_PlayerHealthHUD, clamp(floor(HpPercent* 5), 0, 5) , 120, 200, 3, 3, image_angle, image_blend, image_alpha );

