precision highp float;

uniform vec2 resolution;
uniform float time;

float random(float v) {
	return fract(sin(v * 12.9898) * 43758.5453);
}

float sdCircle(vec2 pos, float radius) {
	return length(pos) - radius;
}
vec2 translate(vec2 pos, vec2 offset) {
	return pos - offset;
}

float opSmoothUnion(float d1, float d2, float k) {
	return -log2(exp2(-k * d1) + exp2(-k * d2)) / k;
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	pos *= 8.0;
	float d = 1e6;
	for (float i = 1.0; i <= 10.0; i++) {
		vec2 offset = 5.0 * sin(2.0 * vec2(random(i), random(i * 10.0)) * time);
		float radius = mix(0.5, 2.0, random(i * 100.0));
		float cd = sdCircle(translate(pos, offset), radius);
		d = opSmoothUnion(d, cd, 4.0);
	}
	vec3 col = mix(vec3(0.2, 0.6, 0.7), vec3(1.0, 0.8, 0.9), smoothstep(-0.05, 0.05, d));
	gl_FragColor = vec4(col, 1.0);
}