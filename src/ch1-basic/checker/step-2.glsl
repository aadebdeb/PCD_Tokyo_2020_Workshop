precision highp float;

uniform vec2 resolution;

vec3 checker(vec2 pos, vec2 size) {
	vec2 m = mod(pos, 2.0 * size);
	return vec3(m, 0.0);
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	vec3 c = checker(10.0 * pos, vec2(1.0));
	gl_FragColor = vec4(c, 1.0);
}