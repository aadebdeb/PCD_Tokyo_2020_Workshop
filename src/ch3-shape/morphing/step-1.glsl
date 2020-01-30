precision highp float;

uniform vec2 resolution;

float sdCircle(vec2 pos, float radius) {
	return length(pos) - radius;
}

float sdRect(vec2 pos, vec2 size) {
	pos = abs(pos) - size;
	return length(max(pos, 0.0)) + min(max(pos.x, pos.y), 0.0);
}

float opSubtraction(float d1, float d2) {
	return max(d1, -d2);
}

float sdOutlineCircle(vec2 pos, float radius, float thickness) {
	return opSubtraction(sdCircle(pos, radius), sdCircle(pos, radius - thickness));
}

float sdOutlineRect(vec2 pos, vec2 size, float thickness) {
	return opSubtraction(sdRect(pos, size), sdRect(pos, size - thickness));
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	float d = sdOutlineCircle(pos, 0.5, 0.2);
	// float d = sdOutlineRect(pos, vec2(0.5), 0.2);
	vec3 col = mix( vec3(0.8, 0.0, 0.0), vec3(1.0), smoothstep(-0.005, 0.005, d));
	gl_FragColor = vec4(col, 1.0);
}

