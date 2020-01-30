precision highp float;

uniform vec2 resolution;

float random(vec2 v) { 
	return fract(sin(dot(v, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec2 random2(vec2 v) {
	return vec2(random(v), random(v + 1000.0));
}

float voronoiNoise(vec2 v) {
	vec2 p = floor(v);
	float minD = 1e6;
	for (int x = -1; x <= 1; x++) {
		for (int y = -1; y <= 1; y++) {
			vec2 q = p + vec2(x, y);
			float d = distance(v, q + random2(q));
			minD = min(minD, d);
		}
	}
	return minD;
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(voronoiNoise(pos * 20.0)), 1.0);
}