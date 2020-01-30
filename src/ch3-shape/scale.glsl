precision highp float;

uniform vec2 resolution;

float sdCircle(vec2 pos, float radius) {
	return length(pos) - radius;
}

vec2 scale(vec2 pos, vec2 rate) {
	return pos /rate;
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	pos = scale(pos, vec2(1.5, 0.5));
	float d = sdCircle(pos, 0.5);
	vec3 col = mix(vec3(1.0), vec3(0.0), smoothstep(-0.005, 0.005, d));
	gl_FragColor = vec4(col, 1.0);
}