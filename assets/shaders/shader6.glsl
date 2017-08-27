
uniform vec2      resolution;
uniform float     time;

float rand(vec2 n) {
    return fract(cos(dot(n, vec2(1., 10.))) * 17.985397);
}

float noise(vec2 n) {
    const vec2 d = vec2(0.0, 1.0);
    vec2 b = floor(n), f = smoothstep(vec2(0.0), vec2(1.0), fract(n + abs(cos(n) / 1900.0)));
    return mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}

float fbm(vec2 n) {
    float total = 0.0, amplitude = 1.0;
    for (int i = 0; i < 3; i++)
    {
        total += noise(n) * amplitude;
        n += n;
        amplitude *= 0.5 + (cos(time*20.0) / 70.0);
    }
    return total;
}

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
	vec2 speed = vec2(0.4,0.2);
	vec2 p = gl_FragCoord.xy * 20.0 / resolution.xx;
	float q = fbm(p - time * 0.2);
	vec2 r = vec2(fbm( cos(time) + p + q + time * speed.x - p.x - p.y), fbm(p + q - time * speed.y ));
	gl_FragColor = vec4(vec3(fbm(r)), 1.0) + vec4(cos(10.0*time) / 17.0, sin(3.0*time + 2.0) / 17.0, cos(5.0*time + 1.0) / 17.0, 1.0);
	//float grad = gl_FragCoord.y / resolution.y;
	//gl_FragColor.xyz *= 1.0-grad;
  return gl_FragColor;
}
