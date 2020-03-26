import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:piquepega/components/pique_component.dart';
import 'package:piquepega/pique_pega_game.dart';
import 'package:piquepega/utils/name_sprits.dart';

import 'movies_direction.dart';

class PlayerSprit {
  final PiquePegaGame game;
  List<Sprite> _sprites;
  double _spriteIndex = 0;
  Rect _bgRect;
  Offset _targetLocation;
  MoviesDirection _moviesDirection = MoviesDirection.down;

  PlayerSprit(this.game) {
    if (game.piqueComponent == null) {
      throw throw new Exception("Informe o pique");
    }

    Rect piqueRect = game.piqueComponent.getPique();
    _bgRect = Rect.fromLTWH(piqueRect.center.dx, piqueRect.center.dy, game.tileSize, game.tileSize);
    _sprites = List();
    PlayersSpritsConst.getAllGeorgeMoves().forEach((f) => _sprites.add(Sprite(f)));
  }

  void render(Canvas canvas) {
    if (_targetLocation == null) {
      _sprites[0].renderRect(canvas, bgRect.inflate(2));
    } else {
      _sprites[_spriteIndex.toInt()].renderRect(canvas, bgRect.inflate(2));
    }
  }

  void update(double t) {
    if (_targetLocation != null) {
      double stepDistance = speed * t;

      Offset toTarget = _targetLocation - _bgRect.center;
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        _bgRect = _bgRect.shift(stepToTarget);
        _setDirection(stepToTarget);
      } else {
        _targetLocation = null;
        game.playerSelected = null;
      }
    }
    _directMove(t);
  }

  void _directMove(double t) {
    if (_targetLocation == null) {
      return;
    }

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
      if (_spriteIndex >= 12) {
        _spriteIndex = 9;
      }
    } else if (_moviesDirection == MoviesDirection.rigth) {
      _spriteIndex = (_spriteIndex) + (10 * t);
      if (_spriteIndex >= 16) {
        _spriteIndex = 13;
      }
    }
  }

  void _setDirection(Offset value) {
//    print(value);
//    print(_targetLocation);
//    double initPositionX = _targetLocation == null ? game.screenSize.width / 2 : _targetLocation.dx;
//    double initPositionY = _targetLocation == null ? game.screenSize.height / 2 : _targetLocation.dy;

//    print('antigo y: $initPositionY, novo y: ${value.dy}');
//    print('init position x: $initPositionX, next positon x: ${value.dx}');

    int diffY = (value.dy).toInt();
    int diffX = (value.dx).toInt();
    print(diffX);
//    print(diffY >= -60 && diffY <= 60);
    if (diffY >= -2 && diffY <= 2) {
      if (diffX > 0) {
        _moviesDirection = MoviesDirection.rigth;
      } else {
        _moviesDirection = MoviesDirection.left;
      }
    } else {
      if (value.dy >= 0) {
        _moviesDirection = MoviesDirection.down;
      } else {
        _moviesDirection = MoviesDirection.up;
      }
    }
  }

  set targetLocation(Offset value) {
    _targetLocation = value;
  }

  double get speed => game.tileSize * 2;
  Rect get bgRect => _bgRect;
}
