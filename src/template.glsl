precision highp float;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);
	vec3 col = vec3(pos, 0.0);
	gl_FragColor = vec4(col, 1.0);
}