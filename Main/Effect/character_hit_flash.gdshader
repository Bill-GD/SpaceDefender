shader_type canvas_item;

uniform vec3 flash_color: source_color = vec3(1, 0, 0);
uniform float strength: hint_range(0, 1, 0.01) = 0;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, flash_color.rgb, strength);
	COLOR = color;
}