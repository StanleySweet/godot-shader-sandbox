shader_type spatial;
render_mode unshaded, cull_disabled, blend_add;

uniform float scroll_speed_y = 0.;
uniform float scroll_speed_x = 0.1;
uniform sampler2D noise : hint_default_black;
uniform sampler2D vertical_gradient : hint_default_black;
uniform sampler2D color_gradient : hint_default_black, repeat_disable;

void vertex() {

	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv_offset = vec2(fract(TIME * scroll_speed_x), fract(TIME * scroll_speed_y));
	float f = texture(noise, UV + uv_offset).r;
	float vertical_factor = texture(vertical_gradient, vec2(UV.y)).r;
	vertical_factor = 2. * vertical_factor - 1.;
	f += vertical_factor;
	
	ALBEDO = texture(color_gradient, vec2(f)).rgb; 
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
