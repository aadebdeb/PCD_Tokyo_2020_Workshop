precision highp float;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;

float sdSphere(vec3 p, float r) {
	return length(p) - r;
}

float map(vec3 p) {
	p = mod(p, 5.0) - 2.5;
	return sdSphere(p, 1.0);
}

vec3 calcNormal(vec3 p) {
	float e = 0.01;
	return normalize(vec3(
		map(p + vec3(e, 0.0, 0.0)) - map(p - vec3(e, 0.0, 0.0)),
		map(p + vec3(0.0, e, 0.0)) - map(p - vec3(0.0, e, 0.0)),
		map(p + vec3(0.0, 0.0, e)) - map(p - vec3(0.0, 0.0, e))
	));
}

vec3 raymarch(vec3 ro, vec3 rd) {
	vec3 p = ro;
	for (int i = 0; i < 64; i++) {
		float d = map(p);
		p += d * rd;
		if (d < 0.01) {
			vec3 normal = calcNormal(p);
			return normal * 0.5 + 0.5;
		}
	}
	return vec3(0.0);
}

void main(void) {
	vec2 st = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);

	vec3 ro = vec3(10.0 * mouse - 5.0, -time);
	vec3 ta = vec3(0.0, 0.0, -5.0 - time);

	vec3 camZ = normalize(ta - ro);
	vec3 camX = normalize(cross(camZ, vec3(0.0, 1.0, 0.0)));
	vec3 camY = cross(camX, camZ);

	vec3 rd = normalize(camX * st.x + camY * st.y + 1.5 * camZ);

	vec3 col = raymarch(ro, rd);
	gl_FragColor = vec4(col, 1.0);
}