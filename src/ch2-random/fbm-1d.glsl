precision highp float;

uniform vec2 resolution;

float random(float v) {
	return fract(sin(v * 12.9898) * 43758.5453);
}

float valueNoise(float v) {
	float i = floor(v);
	float f = smoothstep(0.0, 1.0, fract(v));
	return mix(random(i), random(i + 1.0), f);
}

float fbm(float v) {
	float n = 0.0;
	float a = 0.5;
	for (int i = 0; i < 5; i++) {
		n += a * valueNoise(v);
		v *= 2.01;
		a *= 0.5;
	}
	return n;
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	gl_FragColor = vec4(vec3(fbm(pos.x * 10.0)), 1.0);
}