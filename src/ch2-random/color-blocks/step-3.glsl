precision highp float;

uniform vec2 resolution;
uniform float time;

float random(vec3 v) { 
	return fract(sin(dot(v, vec3(12.9898, 78.233, 19.8321))) * 43758.5453);
}

vec3 random3(vec3 v) {
	return vec3(random(v), random(v + 10000.0), random(v + 20000.0));
}

vec3 colorBlocks(vec2 pos) {
	vec2 posIdx = floor(10.0 * pos);
	float timeIdx = floor(10.0 * time);
	return random3(vec3(posIdx, timeIdx));
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);	
	vec3 col = colorBlocks(pos);
	gl_FragColor = vec4(col, 1.0);
}