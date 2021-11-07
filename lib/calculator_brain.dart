import 'dart:math';

import 'package:flutter/material.dart';

const kNormalWeightColor = Color(0xFF24DB76);
const kUnderWeightColor = Color(0xFF88ABFE);
const kOverWeightColor = Color(0xFFFF897A);

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight});

  double? _bmi;

  double? get bmi => _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return 'OVERWEIGHT';
      } else if (_bmi! >= 18.5) {
        return 'NORMAL';
      } else {
        return 'UNDERWEIGHT';
      }
    } else {
      return 'UNSPECIFIED';
    }
  }

  Color? getResultColor() {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return kOverWeightColor;
      } else if (_bmi! >= 18.5) {
        return kNormalWeightColor;
      } else {
        return kUnderWeightColor;
      }
    } else {
      return null;
    }
  }

  String getInterpretation() {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return 'You have a higher than normal body\nweight. Try to exercise more.';
      } else if (_bmi! >= 18.5) {
        return 'You have a normal body weight.\nGood job!';
      } else {
        return 'You have a lower than normal body\nweight. You can eat a bit more.';
      }
    } else {
      return 'UNSPECIFIED';
    }
  }
}
