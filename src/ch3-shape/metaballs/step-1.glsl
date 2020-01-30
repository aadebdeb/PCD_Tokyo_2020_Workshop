precision highp float;

uniform vec2 resolution;
uniform float time;

float sdCircle(vec2 pos, float radius) {
	return length(pos) - radius;
}
vec2 translate(vec2 pos, vec2 offset) {
	return pos - offset;
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	pos *= 8.0;
	vec2 offset = 5.0 * sin(vec2(1.0, 0.8) * time);
	float radius = 1.0;
	float d = sdCircle(translate(pos, offset), radius);
	vec3 col = mix(vec3(0.2, 0.6, 0.7), vec3(1.0, 0.8, 0.9), smoothstep(-0.05, 0.05, d));
	gl_FragColor = vec4(col, 1.0);
}