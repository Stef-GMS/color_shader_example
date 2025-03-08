#version 330 core

#include <flutter/runtime_effect.glsl>

uniform sampler2D texture0;
uniform vec2 resolution;
uniform vec4 color;

out vec4 fragColor;

void main()
{
    float x = FlutterFragCoord().x;
    float y = FlutterFragCoord().y;

    // Sample the texture
    vec2 uv = vec2(x, y) / resolution;
    vec4 texColor = texture(texture0, uv);

    // Calculate grayscale
    float brightness = (texColor.r + texColor.g + texColor.b) / 3.f;
    vec4 grayScale = vec4(brightness, brightness, brightness, texColor.a);

    // Apply the color
    fragColor = grayScale * color;
    fragColor.a *= texColor.a; // preserves transparency.
}