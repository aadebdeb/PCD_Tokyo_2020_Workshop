precision highp float;

uniform vec2 resolution;

float random(vec2 v) { 
	return fract(sin(dot(v, vec2(12.9898, 78.233))) * 43758.5453);
}

vec3 colorBlocks(vec2 pos) {
	vec2 posIdx = floor(10.0 * pos);
	return vec3(random(posIdx));
}

void main(void) {
	vec2 pos = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);	
	vec3 col = colorBlocks(pos);
	gl_FragColor = vec4(col, 1.0);
}