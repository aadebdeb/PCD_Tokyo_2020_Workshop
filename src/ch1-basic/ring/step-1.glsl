precision highp float;

uniform vec2 resolution;

vec3 ring(vec2 pos) {
	float l = length(pos);
	return vec3(l);
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	vec3 col = ring(pos);
	gl_FragColor = vec4(col, 1.0);
}