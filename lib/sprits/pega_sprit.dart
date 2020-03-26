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
  Rect _bgRect;
  double get speed => game.tileSize * 2;
  Offset targetLocation;
  MoviesDirection _moviesDirection;

  PegaSprit(this.game) {
    _bgRect = Rect.fromLTWH(game.screenSize.width / 2, game.screenSize.height / 2, game.tileSize, game.tileSize);
    _sprites = List();
    setTargetLocation();
    PlayersSpritsConst.getAllBettyMoves().forEach((f) => _sprites.add(Sprite(f)));
  }

  void render(Canvas canvas) {
    _sprites[_spriteIndex.toInt()].renderRect(canvas, _bgRect.inflate(2));
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
    bool encontrou = player.bgRect.overlaps(_bgRect);
    if (encontrou != null) {
      print('---> $encontrou');
    }

    Offset toTarget = player.bgRect.center - _bgRect.center;

    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      _bgRect = _bgRect.shift(stepToTarget);
    } else {
//      print('encontrou');
    }
  }

  void _moveRandom(double t) {
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(_bgRect.left, _bgRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      _bgRect = _bgRect.shift(stepToTarget);
    } else {
      _bgRect = _bgRect.shift(toTarget);
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

  void _setDirection(Offset value) {
    if (_bgRect != null) {
      int diffY = (_bgRect.center.dy - value.dy).toInt();
      int diffX = (_bgRect.center.dx - value.dx).toInt();

      if (diffY >= -80 && diffY <= 80) {
        if (diffX < 0) {
          _moviesDirection = MoviesDirection.rigth;
        } else {
          _moviesDirection = MoviesDirection.left;
        }
      } else {
        if (diffY >= 0) {
          _moviesDirection = MoviesDirection.up;
        } else {
          _moviesDirection = MoviesDirection.down;
        }
      }
    }
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
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
    targetLocation = Offset(x, y);
    _setDirection(targetLocation);
//    targetLocation = Offset(game.screenSize.width / 2, game.screenSize.height / 2);
  }
}
