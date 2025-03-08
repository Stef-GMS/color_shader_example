import 'dart:ui';

import 'package:color_shader_example/game/shader_game.dart';
import 'package:flame/components.dart';

class ApplyImageShader extends SpriteComponent with HasGameReference<ShaderGame> {
  ApplyImageShader({
    super.sprite,
    super.position,
    super.size,
    required this.shader,
    required this.color,
  });

  final FragmentShader shader;
  final Color color;

  @override
  void onLoad() {
    // Set the texture
    shader.setImageSampler(0, sprite!.image);

    // Set the resolution
    shader.setFloat(0, size.x);
    shader.setFloat(1, size.y);

    // Set the color
    shader.setFloat(2, (color.red / 255).toDouble()); // r
    shader.setFloat(3, (color.green / 255).toDouble()); // g
    shader.setFloat(4, (color.blue / 255).toDouble()); // b
    shader.setFloat(5, (color.alpha / 255).toDouble()); // a
    paint.shader = shader;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      paint,
    );
    // super.render(canvas); // Prevents Flame from rendering it
  }
}
