import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:piquepega/components/background_component.dart';
import 'package:piquepega/components/pique_component.dart';
import 'package:piquepega/sprits/pega_sprit.dart';
import 'package:piquepega/sprits/player_sprit.dart';

class PiquePegaGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  BackgroundComponent _background;
  PiqueComponent _piqueComponent;

  BackgroundComponent get background => _background;
  PegaSprit _pegaSprit;
  PlayerSprit _playerSprit;
  PlayerSprit playerSelected;

  PiquePegaGame() {
    _init();
  }

  void _init() async {
    resize(await Flame.util.initialDimensions());
//    iniciar variaveis
    rnd = Random();

    _background = BackgroundComponent(this);
    _piqueComponent = PiqueComponent(this);
    _pegaSprit = PegaSprit(this);
    _playerSprit = PlayerSprit(this);
  }

  void render(Canvas canvas) {
    _background.render(canvas);
    _piqueComponent.render(canvas);
    _pegaSprit.render(canvas);
    _playerSprit.render(canvas);
  }

  void update(double t) {
    _pegaSprit.update(t, playerSelected);
    _playerSprit.update(t);
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    _playerSprit.targetLocation = d.globalPosition;
    playerSelected = _playerSprit;
  }

  PiqueComponent get piqueComponent => _piqueComponent;

  PegaSprit get pegaSprit => _pegaSprit;

  PlayerSprit get playerSprit => _playerSprit;
}
