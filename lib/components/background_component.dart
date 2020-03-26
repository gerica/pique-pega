import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:piquepega/pique_pega_game.dart';

class BackgroundComponent {
  final PiquePegaGame game;
//  Sprite bgSprite;
  Paint bgPaint;
  Rect bgRect;

  BackgroundComponent(this.game) {
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    bgPaint = Paint();
    bgPaint.color = Color(0xff1fb779);
  }

  void render(Canvas c) {
    c.drawRect(bgRect, bgPaint);
  }

  void update(double t) {}
}
