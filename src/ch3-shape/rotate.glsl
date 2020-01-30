precision highp float;

uniform vec2 resolution;

#define PI 3.14159265359

float sdRect(vec2 pos, vec2 size) {
	pos = abs(pos) - size;
	return length(max(pos, 0.0)) + min(max(pos.x, pos.y), 0.0);
}

vec2 rotate(vec2 pos, float radian) {
	float c = cos(-radian);
	float s = sin(-radian);
	return mat2(c, s, -s, c) * pos;
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	pos = rotate(pos, PI / 3.0);
	float d = sdRect(pos, vec2(0.6, 0.4));
	vec3 col = mix(vec3(1.0), vec3(0.0), smoothstep(-0.005, 0.005, d));
	gl_FragColor = vec4(col, 1.0);
}