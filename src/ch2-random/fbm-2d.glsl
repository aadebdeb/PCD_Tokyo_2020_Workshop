precision highp float;

uniform vec2 resolution;

float random(vec2 v) { 
	return fract(sin(dot(v, vec2(12.9898, 78.233))) * 43758.5453);
}

float valueNoise(vec2 v) {
	vec2 i = floor(v);
	vec2 f = smoothstep(0.0, 1.0, fract(v));
	return mix(
		mix(random(i), random(i + vec2(1.0, 0.0)), f.x),
		mix(random(i + vec2(0.0, 1.0)), random(i + vec2(1.0, 1.0)), f.x),
		f.y
	);
}

float fbm(vec2 x) {
	float n = 0.0;
	float a = 0.5;
	for (int i = 0; i < 5; i++) {
		n += a * valueNoise(x);
		x *= 2.0;
		a *= 0.5;
	}
	return n;
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(fbm(pos * 10.0)), 1.0);
}