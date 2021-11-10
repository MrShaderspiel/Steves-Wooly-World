#version 120

uniform sampler2D lightmap;
uniform sampler2D colortex4;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	vec3 block_color = texture2D(texture, floor((texcoord)*16.0)/16.0).rgb*1.5;
	
	vec4 color = texture2D(colortex4, vec2(texcoord.x*64, texcoord.y*32)) * glcolor;
	color.rgb *= block_color;

	color *= texture2D(lightmap, lmcoord);
/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
