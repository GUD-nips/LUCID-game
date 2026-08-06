shader_type canvas_item;

uniform vec2 offset = vec2(4.0, 4.0);
uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.5);

void fragment() {
    // Sample the original texture using a UV offset converted to pixel size
    vec4 tex = texture(TEXTURE, UV - offset * TEXTURE_PIXEL_SIZE);
    
    // Mix the shadow with the original drawing
    vec4 original = texture(TEXTURE, UV);
    COLOR = mix(tex, original, original.a);
    
    // Force the shadow pixels to the uniform color while preserving the shape's alpha
    if (original.a == 0.0 && tex.a > 0.0) {
        COLOR = shadow_color;
    }
}