precision highp float;

uniform vec2 resolution;

void main(void) {
	vec2 pos = gl_FragCoord.xy / resolution;
	vec3 col = vec3(step(0.5, pos.x));
	gl_FragColor = vec4(col, 1.0);
}