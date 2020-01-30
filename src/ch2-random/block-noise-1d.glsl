precision highp float;

uniform vec2 resolution;

float random(float v) {
	return fract(sin(v * 12.9898) * 43758.5453);
}

float blockNoise(float v) {
	return random(floor(v));
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	gl_FragColor = vec4(vec3(blockNoise(pos.x * 50.0)), 1.0);
}