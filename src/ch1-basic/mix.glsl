precision highp float;

uniform vec2 resolution;

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	vec3 col = mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), pos.x);
	gl_FragColor = vec4(col, 1.0);
}