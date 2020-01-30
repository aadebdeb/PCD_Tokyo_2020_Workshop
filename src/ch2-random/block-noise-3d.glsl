precision highp float;

uniform vec2 resolution;
uniform float time;

float random(vec3 v) { 
	return fract(sin(dot(v, vec3(12.9898, 78.233, 19.8321))) * 43758.5453);
}

float blockNoise(vec3 v) {
	return random(floor(v));
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(blockNoise(vec3(pos * 50.0, time))), 1.0);
}