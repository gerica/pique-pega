import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:piquepega/pique_pega_game.dart';
import 'package:piquepega/sprits/movies_direction.dart';
import 'package:piquepega/sprits/player_sprit.dart';
import 'package:piquepega/utils/name_sprits.dart';

class PegaSprit {
  final PiquePegaGame game;
  List<Sprite> _sprites;
  double _spriteIndex = 0;
  Rect bgRect;
  double get speed => game.tileSize * 2;
  Offset targetLocation;
  MoviesDirection _moviesDirection;

  PegaSprit(this.game) {
    setTargetLocation();
    bgRect = Rect.fromLTWH(game.screenSize.width / 2, game.screenSize.height / 2, game.tileSize, game.tileSize);
//    bgPaint = Paint();
//    bgPaint.color = Color(0xffee3000);
    _sprites = List();
    PlayersSpritsConst.getAllBettyMoves().forEach((f) => _sprites.add(Sprite(f)));
  }

  void render(Canvas canvas) {
    _sprites[_spriteIndex.toInt()].renderRect(canvas, bgRect.inflate(2));
  }

  void update(double t, PlayerSprit player) {
    if (player != null) {
      _catchPlayer(t, player);
    } else {
      _moveRandom(t);
    }

    _directMove(t);
  }

  void _catchPlayer(double t, PlayerSprit player) {
    double stepDistance = speed * t * 1.5;
    Offset toTarget = player.bgRect.bottomRight - Offset(bgRect.left, bgRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      bgRect = bgRect.shift(stepToTarget);
    } else {
//      print('encontrou');
    }
  }

  void _moveRandom(double t) {
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(bgRect.left, bgRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      bgRect = bgRect.shift(stepToTarget);
    } else {
      bgRect = bgRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void _directMove(double t) {
    if (_moviesDirection == MoviesDirection.down) {
      _spriteIndex += 10 * t;
      if (_spriteIndex >= 4) {
        _spriteIndex -= 4;
      }
    } else if (_moviesDirection == MoviesDirection.up) {
      _spriteIndex = (_spriteIndex) + (10 * t);
      if (_spriteIndex >= 8) {
        _spriteIndex = 4;
      }
    } else if (_moviesDirection == MoviesDirection.left) {
      _spriteIndex = (_spriteIndex) + (10 * t);
      if (_spriteIndex >= 8) {
        _spriteIndex = 4;
      }
    } else if (_moviesDirection == MoviesDirection.rigth) {
      _spriteIndex = (_spriteIndex) + (10 * t);
      if (_spriteIndex >= 8) {
        _spriteIndex = 4;
      }
    }
  }

  void setTargetLocation() {
//    double x = game.rnd.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
//    double y = game.rnd.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
//    double initPositionX = targetLocation == null ? game.screenSize.width / 2 : targetLocation.dx;
//    double initPositionY = targetLocation == null ? game.screenSize.height / 2 : targetLocation.dy;

//    print('init position y: $initPositionY, next positon y: $y');
//    print('init position x: $initPositionX, next positon x: $x');

//    if (y >= initPositionY) {
//      _moviesDirection = MoviesDirection.down;
//    } else {
//      _moviesDirection = MoviesDirection.up;
//    }
//    if (x >= initPositionX) {
//      _moviesDirection = MoviesDirection.left;
//    } else {
//      _moviesDirection = MoviesDirection.rigth;
//    }
    targetLocation = Offset(game.screenSize.width / 2, game.screenSize.height / 2);
  }
}
