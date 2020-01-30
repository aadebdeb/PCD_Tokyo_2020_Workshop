precision highp float;

uniform vec2 resolution;

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	gl_FragColor = vec4(sin(20.0 * pos) * 0.5 + 0.5, 0.0, 1.0);
}