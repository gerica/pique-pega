import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piquepega/pique_pega_game.dart';
import 'package:piquepega/utils/name_sprits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(PlayersSpritsConst.getAll());

//  Flame.images.loadAll(<String>[
//    PlayersSpritsConst.bettyDown1,
//    'players/betty_down_2.png',
//    'players/betty_down_3.png',
//    'players/betty_down_4.png',
//    'players/betty_left_1.png',
//    'players/betty_left_2.png',
//    'players/betty_left_3.png',
//    'players/betty_left_4.png',
//    'players/betty_rigth_1.png',
//    'players/betty_rigth_2.png',
//    'players/betty_rigth_3.png',
//    'players/betty_rigth_4.png',
//    'players/betty_up_1.png',
//    'players/betty_up_2.png',
//    'players/betty_up_3.png',
//    'players/betty_up_4.png',
//  ]);

  PiquePegaGame game = PiquePegaGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
