precision highp float;

uniform vec2 mouse;

void main(void) {
	gl_FragColor = vec4(mouse, 0.0, 1.0);
}