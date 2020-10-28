import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/game/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ola_space/widgets/game.dart';
import 'package:ola_space/widgets/rocket.dart';
import 'package:flutter/gestures.dart';

var game;
Component component;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SpaceGame game = SpaceGame();
  runApp(game.widget);
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
}
