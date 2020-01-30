precision highp float;

uniform vec2 resolution;
uniform float time;

float random(vec3 v) { 
	return fract(sin(dot(v, vec3(12.9898, 78.233, 19.8321))) * 43758.5453);
}

float valueNoise(vec3 v) {
	vec3 i = floor(v);
	vec3 f = smoothstep(0.0, 1.0, fract(v));
	return  mix(
		mix(
			mix(random(i), random(i + vec3(1.0, 0.0, 0.0)), f.x),
			mix(random(i + vec3(0.0, 1.0, 0.0)), random(i + vec3(1.0, 1.0, 0.0)), f.x),
			f.y
		),
		mix(
			mix(random(i + vec3(0.0, 0.0, 1.0)), random(i + vec3(1.0, 0.0, 1.0)), f.x),
			mix(random(i + vec3(0.0, 1.0, 1.0)), random(i + vec3(1.0, 1.0, 1.0)), f.x),
			f.y
		),
		f.z
	);
}

float fbm(vec3 x) {
	float n = 0.0;
	float a = 0.5;
	for (int i = 0; i < 3; i++) {
		n += a * valueNoise(x);
		x *= 2.0;
		a *= 0.5;
	}
	return n;
}

vec3 rgbShift(vec2 pos) {
	float n = fbm(vec3(2.0 * pos, 0.1 * time));
	return vec3(smoothstep(0.5, 0.55, n));
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	vec3 col = rgbShift(pos);
	gl_FragColor = vec4(col, 1.0);
}