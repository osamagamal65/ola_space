import 'package:flame/components/mixins/resizable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class BackgroundControllers extends FlareControls {
  void idle() {
    play("night_idle");
  }
}

class BackgroundComponent extends FlareActorComponent with Resizable {
  BackgroundControllers backgroundControllers;

  BackgroundComponent(this.backgroundControllers)
      : super(
          FlareActorAnimation(
            'assets/flare/Stars_background.flr',
            controller: backgroundControllers,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          width: 300,
          height: 300,
        );

  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(x, y, width, height);
    final paint = Paint()..color = const Color(0xFFfafbfc);
    c.drawRect(rect, paint);
    super.render(c);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    x = 0;
    y = 0;
  }
}
