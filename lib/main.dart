import 'package:color_shader_example/game/shader_game.dart';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final game = ShaderGame();

  runApp(
    GameWidget(game: game),
  );
}
