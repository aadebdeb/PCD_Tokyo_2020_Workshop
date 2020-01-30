precision highp float;

uniform vec2 resolution;
uniform float time;

vec3 c1 = vec3(0.5, 0.7, 1.0);
vec3 c2 = vec3(0.1, 0.3, 0.8);

vec3 ring(vec2 pos) {
	float l = length(20.0 * pos);
	float s = sin(l - time) * 0.5 + 0.5;
	return mix(c1, c2, smoothstep(0.8, 0.9, s));
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	vec3 col = ring(pos);
	gl_FragColor = vec4(col, 1.0);
}