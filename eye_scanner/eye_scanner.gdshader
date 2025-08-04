shader_type spatial;
render_mode cull_disabled;

void fragment() {
	float modTime = sin(TIME * 0.5);
 	uint phase = abs(modTime) < 0.9 ? 1u : 0u;
	
	if (phase == 0u)
	{
		if (UV.y < 0.7f)
			discard;
			
			
		if (1.0 - UV.x < sin(TIME) * 4.0)
			discard;

	}
	else
	{
		if (UV.y > 0.7f)
			discard;
			
		if (1.0 - UV.x < abs(modTime) || 0.8 - UV.x > abs(modTime))
			discard;
	}
	
	ALBEDO = vec3(1.0, 0.0, 0.0) * 2.0;
	EMISSION = vec3(1.0, 0.0, 0.0) * 2.0;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
