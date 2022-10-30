import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GameWidget(game: Move()));
}

class Move extends FlameGame with KeyboardEvents, HasCollisionDetection {
  static const _size = 100.0;
  final paint = Paint()..color = Colors.lightGreenAccent;
  // paints the object on the screen
  double _x = 100.0;
  double _y = 200.0;
  // starting position,  0,0 in top left

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final rect = Rect.fromLTWH(_x, _y, _size, _size);
    canvas.drawRect(rect, paint);
  }

// below
  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _x -= 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _x += 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      _y -= 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      _y += 10.0;
    }
    return KeyEventResult.handled;
  }
}
