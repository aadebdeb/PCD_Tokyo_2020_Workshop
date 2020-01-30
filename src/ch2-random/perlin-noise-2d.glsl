precision highp float;

uniform vec2 resolution;

float random(vec2 v) { 
	return fract(sin(dot(v, vec2(12.9898, 78.233))) * 43758.5453);
}

vec2 random2(vec2 v) {
	return vec2(random(v), random(v + 1000.0));
}

float perlinNoise(vec2 v) {
	vec2 i = floor(v);
	vec2 f = fract(v);

	vec2 v00 = f;
	vec2 v10 = f - vec2(1.0, 0.0);
	vec2 v01 = f - vec2(0.0, 1.0);
	vec2 v11 = f - vec2(1.0, 1.0);

	vec2 i00 = i;
	vec2 i10 = i + vec2(1.0, 0.0);
	vec2 i01 = i + vec2(0.0, 1.0);
	vec2 i11 = i + vec2(1.0, 1.0);

	vec2 g00 = normalize(random2(i00) * 2.0 - 1.0);
	vec2 g10 = normalize(random2(i10) * 2.0 - 1.0);
	vec2 g01 = normalize(random2(i01) * 2.0 - 1.0);
	vec2 g11 = normalize(random2(i11) * 2.0 - 1.0);

	float d00 = dot(v00, g00);
	float d10 = dot(v10, g10);
	float d01 = dot(v01, g01);
	float d11 = dot(v11, g11);

	vec2 u = smoothstep(0.0, 1.0, f);
	return mix(
		mix(d00, d10, u.x),
		mix(d01, d11, u.x),
		u.y
	);
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(perlinNoise(pos * 10.0) * 0.5 + 0.5), 1.0);
}