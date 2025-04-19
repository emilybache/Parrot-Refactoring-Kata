import 'dart:math';

import 'package:parrot_refactoring_kata/parrot_type.dart';

class Parrot {
  final ParrotType type;
  final int numberOfCoconuts;
  final double voltage;
  final bool isNailed;

  Parrot(
    this.type, {
    required this.numberOfCoconuts,
    required this.voltage,
    required this.isNailed,
  });

  double speed() {
    switch (type) {
      case ParrotType.european:
        return baseSpeed;

      case ParrotType.african:
        return max(0, baseSpeed - loadFactor * numberOfCoconuts);

      case ParrotType.norwegianBlue:
        return isNailed ? 0 : _baseSpeed(voltage);
    }
  }

  double _baseSpeed(double voltage) {
    return min(24.0, voltage * baseSpeed);
  }

  double get loadFactor => 9.0;

  double get baseSpeed => 12.0;
}
