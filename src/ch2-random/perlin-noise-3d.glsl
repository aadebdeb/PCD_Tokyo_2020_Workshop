precision highp float;

uniform vec2 resolution;
uniform float time;

float random(vec3 v) { 
	return fract(sin(dot(v, vec3(12.9898, 78.233, 19.8321))) * 43758.5453);
}

vec3 random3(vec3 v) {
	return vec3(random(v), random(v + 1000.0), random(v + 2000.0));
}

float perlinNoise(vec3 v) {
	vec3 i = floor(v);
	vec3 f = fract(v);

	vec3 v000 = f;
	vec3 v100 = f - vec3(1.0, 0.0, 0.0);
	vec3 v010 = f - vec3(0.0, 1.0, 0.0);
	vec3 v110 = f - vec3(1.0, 1.0, 0.0);
	vec3 v001 = f - vec3(0.0, 0.0, 1.0);
	vec3 v101 = f - vec3(1.0, 0.0, 1.0);
	vec3 v011 = f - vec3(0.0, 1.0, 1.0);
	vec3 v111 = f - vec3(1.0, 1.0, 1.0);

	vec3 i000 = i;
	vec3 i100 = i + vec3(1.0, 0.0, 0.0);
	vec3 i010 = i + vec3(0.0, 1.0, 0.0);
	vec3 i110 = i + vec3(1.0, 1.0, 0.0);
	vec3 i001 = i + vec3(0.0, 0.0, 1.0);
	vec3 i101 = i + vec3(1.0, 0.0, 1.0);
	vec3 i011 = i + vec3(0.0, 1.0, 1.0);
	vec3 i111 = i + vec3(1.0, 1.0, 1.0);

	vec3 g000 = normalize(random3(i000) * 2.0 - 1.0);
	vec3 g100 = normalize(random3(i100) * 2.0 - 1.0);
	vec3 g010 = normalize(random3(i010) * 2.0 - 1.0);
	vec3 g110 = normalize(random3(i110) * 2.0 - 1.0);
	vec3 g001 = normalize(random3(i001) * 2.0 - 1.0);
	vec3 g101 = normalize(random3(i101) * 2.0 - 1.0);
	vec3 g011 = normalize(random3(i011) * 2.0 - 1.0);
	vec3 g111 = normalize(random3(i111) * 2.0 - 1.0);

	float d000 = dot(v000, g000);
	float d100 = dot(v100, g100);
	float d010 = dot(v010, g010);
	float d110 = dot(v110, g110);
	float d001 = dot(v001, g001);
	float d101 = dot(v101, g101);
	float d011 = dot(v011, g011);
	float d111 = dot(v111, g111);

	vec3 u = smoothstep(0.0, 1.0, f);
	return mix(
		mix(
			mix(d000, d100, u.x),
			mix(d010, d110, u.x),
			u.y
		),
		mix(
			mix(d001, d101, u.x),
			mix(d011, d111, u.x),
			u.y
		),
		u.z
	);
}

void main(void) {
	vec2 pos = gl_FragCoord.xy / min(resolution.x, resolution.y);
	gl_FragColor = vec4(vec3(perlinNoise(vec3(pos * 10.0, time)) * 0.5 + 0.5), 1.0);
}