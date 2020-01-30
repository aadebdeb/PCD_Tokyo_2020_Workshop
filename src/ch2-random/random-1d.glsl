precision highp float;

uniform vec2 resolution;

float random(float v) {
	return fract(sin(v * 12.9898) * 43758.5453);
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	gl_FragColor = vec4(vec3(random(pos.x)), 1.0);
}