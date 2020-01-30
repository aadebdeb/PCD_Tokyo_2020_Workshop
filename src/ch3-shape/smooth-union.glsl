precision highp float;

uniform vec2 resolution;

float sdCircle(vec2 pos, float radius) {
	return length(pos) - radius;
}

float sdRect(vec2 pos, vec2 size) {
	pos = abs(pos) - size;
	return length(max(pos, 0.0)) + min(max(pos.x, pos.y), 0.0);
}

vec2 translate(vec2 pos, vec2 offset) {
	return pos - offset;
}

float opSmoothUnion(float d1, float d2, float k) {
	return -log2(exp2(-k * d1) + exp2(-k * d2)) / k;
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	float rd = sdRect(pos, vec2(0.6, 0.4));
	float cd = sdCircle(translate(pos, vec2(0.5, 0.3)), 0.5);
	float d = opSmoothUnion(rd, cd, 32.0);
	vec3 col = mix(vec3(1.0), vec3(0.0), smoothstep(-0.005, 0.005, d));
	gl_FragColor = vec4(col, 1.0);
}