import 'dart:ui';

import 'package:color_shader_example/utilities/apply_image_shader.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ShaderGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.white;

  @override
  Future<void> onLoad() async {
    final fragmentProgram = await FragmentProgram.fromAsset('assets/shaders/my_shader.frag');

    // Using an image that has partial transparency.  The transparent part shows the color of the background,
    // while the existing color is colored with value sent to Shader.
    await add(
      ApplyImageShader(
        position: Vector2.all(0),
        // sprite: await Sprite.load('arrow_up_outline.png'),
        sprite: await Sprite.load('cat_transparent.png'),
        shader: fragmentProgram.fragmentShader(),
        color: const Color.fromARGB(255, 0, 255, 0),
      ),
    );

    // Using an image that is not transparent.  The existing color, in this case white is colored with value sent to Shader.
    await add(
      ApplyImageShader(
        position: Vector2(256, 0),
        // sprite: await Sprite.load('arrow_up_outline.png'),
        sprite: await Sprite.load('cat.png'),
        shader: fragmentProgram.fragmentShader(),
        // color: const Color.fromARGB(255, 255, 255, 0),
        color: const Color.fromARGB(255, 0, 255, 0),
      ),
    );
  }
}
