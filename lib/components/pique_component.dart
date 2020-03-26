import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:piquepega/pique_pega_game.dart';
import 'package:piquepega/utils/name_sprits.dart';

class PiqueComponent {
  final PiquePegaGame game;
  List<SpritsRect> _listSpritsRect;

  List<SpritsRect> get listSpritsRect => _listSpritsRect;

  PiqueComponent(this.game) {
    _listSpritsRect = List();

    double piqueSize = game.tileSize * 2;
    for (int x = 0; x < 4; x++) {
      Rect rectLeft = Rect.fromLTWH(x.ceilToDouble(), (x * game.tileSize * 4.5).ceilToDouble(), piqueSize, piqueSize);
      _listSpritsRect.add(SpritsRect(bgRects: rectLeft, sprite: Sprite(PlayersSpritsConst.getAllPracas()[game.rnd.nextInt(4)])));
      Rect rectRigth = Rect.fromLTWH(game.screenSize.width - piqueSize, (x * game.tileSize * 4.5).ceilToDouble(), piqueSize, piqueSize);
      _listSpritsRect.add(SpritsRect(bgRects: rectRigth, sprite: Sprite(PlayersSpritsConst.getAllPracas()[game.rnd.nextInt(4)])));
    }
  }

  void render(Canvas canvas) {
    _listSpritsRect.forEach((p) {
//      print(game.rnd.nextInt(2));
      p.sprite.renderRect(canvas, p.bgRects.inflate(2));
    });
  }

  void update(double t) {}

  Rect getPique() {
    return _listSpritsRect[game.rnd.nextInt(4)].bgRects;
  }
}

class SpritsRect {
  Rect bgRects;
  Sprite sprite;

  SpritsRect({this.bgRects, this.sprite});
}
