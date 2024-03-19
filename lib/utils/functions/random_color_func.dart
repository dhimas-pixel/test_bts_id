import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorFunc {
  static Color randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
