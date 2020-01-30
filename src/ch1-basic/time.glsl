precision highp float;

uniform vec2 resolution;
uniform float time;

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	gl_FragColor = vec4(pos, sin(time) * 0.5 + 0.5, 1.0);
}