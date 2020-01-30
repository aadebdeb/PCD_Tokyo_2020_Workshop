precision highp float;

uniform vec2 resolution;
uniform float time;

float random(vec3 v) { 
	return fract(sin(dot(v, vec3(12.9898, 78.233, 19.8321))) * 43758.5453);
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(random(vec3(pos, time))), 1.0);
}