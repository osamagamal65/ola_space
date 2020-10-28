import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:ola_space/widgets/game.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flare_flutter/flare.dart';

class EnemyControllers extends FlareControls {
  void idle() {
    super.play("idle");
  }
}

class Enemy extends FlareActorComponent with Resizable {
  EnemyControllers enemyController;

  Enemy(SpaceGame game, double x, double y, this.enemyController)
      : super(
          FlareActorAnimation(
            'assets/flare/Virus.flr',
            controller: enemyController,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          width: 50,
          height: 50.0,
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
    this.x = this.x;
    this.y = this.y;
  }
}
