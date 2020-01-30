precision highp float;

uniform vec2 resolution;

float sdRect(vec2 pos, vec2 size) {
	pos = abs(pos) - size;
	return length(max(pos, 0.0)) + min(max(pos.x, pos.y), 0.0);
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	float d = sdRect(pos, vec2(0.6, 0.4));
	vec3 col = mix(vec3(1.0), vec3(0.0), smoothstep(-0.005, 0.005, d));
	gl_FragColor = vec4(col, 1.0);
}