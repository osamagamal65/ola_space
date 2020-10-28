import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:ola_space/widgets/enemy.dart';
import 'package:ola_space/widgets/rocket.dart';
import 'dart:math';

class SpaceGame extends BaseGame with HorizontalDragDetector, PanDetector {
  Size screenSize;
  bool hasWon = false;
  double tileSize;
  List<Enemy> enemies = [];
  Rocket rocket;
  Random rnd;
  SpaceGame() {
    initialize();
  }

  Enemy generateEnemy() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height / 2);
    var controller = EnemyControllers();
    var enemy = Enemy(this, x, y, controller);

    add(enemy);
    controller.idle();
    return enemy;
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    rnd = Random();
    enemies = List<Enemy>.generate(16, ((e) => generateEnemy()));
    rocket =
        Rocket(this, (screenSize.width - 100) * .5, (screenSize.height - 100) * .9, RocketControllers());
    rocket.rocketControllers.idle();
    ;
    add(rocket);
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();

    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    super.render(canvas);
  }

  void update(double t) {
    enemies.forEach((enemy) => enemy.update(t));
    rocket.update(t);
    super.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails d) {
    print("Player tap down on ${d.globalPosition.dx} - ${d.globalPosition.dy}");
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      hasWon = true;
    }
    rocket.x = d.globalPosition.dx;
  }

  @override
  void onTapUp(TapUpDetails details) {
    print("Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  @override
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    rocket.x = details.globalPosition.dx;
    super.onHorizontalDragUpdate(details);
  }

  @override
  void onHorizontalDragCancel() {
    super.onHorizontalDragCancel();
  }

  @override
  void onHorizontalDragEnd(DragEndDetails details) {
    // rocket.x = details.primaryVelocity;
    super.onHorizontalDragEnd(details);
  }
}
