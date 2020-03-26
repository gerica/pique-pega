import 'dart:ui';

import 'package:flame/sprite.dart';
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

  bool _tapPique;

  set tapPique(bool value) {
    _tapPique = value;
  }

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
//        _setDirection(_targetLocation);
      } else {
        _targetLocation = null;
        if (_tapPique) {
          game.playerSelected = null;
        }
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

  set targetLocation(Offset value) {
    _targetLocation = value;
    _setDirection(value);
  }

  double get speed => game.tileSize * 2;
  Rect get bgRect => _bgRect;
}
