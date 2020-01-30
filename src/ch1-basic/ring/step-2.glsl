precision highp float;

uniform vec2 resolution;
uniform float time;

vec3 ring(vec2 pos) {
	float l = length(20.0 * pos);
	float s = sin(l - time) * 0.5 + 0.5;
	return vec3(s);
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	vec3 col = ring(pos);
	gl_FragColor = vec4(col, 1.0);
}