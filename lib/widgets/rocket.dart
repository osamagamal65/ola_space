import 'package:flame/components/mixins/resizable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:ola_space/widgets/game.dart';

class RocketControllers extends FlareControls {
  void idle() {
    play("idel");
  }
}

class Rocket extends FlareActorComponent with Resizable {
  Rect rocketRect;
  RocketControllers rocketControllers;
  SpaceGame game;
  Rocket(this.game, double x, double y, this.rocketControllers)
      : super(
          FlareActorAnimation(
            'assets/flare/rocket_idle.flr',
            controller: rocketControllers,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          width: 100,
          height: 100,
        ) {
    this.x = x;
    this.y = y;
  }

  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(x, y, width, height);
    final paint = Paint()..color = Colors.transparent;
    c.drawRect(rect, paint);
    super.render(c);
  }

  @override
  void resize(Size size) {
    super.resize(size);
  }
}
