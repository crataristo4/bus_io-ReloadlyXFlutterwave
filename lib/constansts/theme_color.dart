import 'dart:ui';

import 'package:flutter/material.dart';

class CustomColors {
  static Color teal = Color(0xFF0898A0);

  static Color lightTeal = Color(0xFFE6F5F6);
  static Color inactiveButton = Color(0xFF0898A0).withOpacity(0.1);
  static Color llColor = Color(0xFF811C48);
  static Color c5 = Color(0xFF77DDFF);
  static Color c6 = Color(0xFFC279FB);
  static Color c7 = Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;

  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
  static List<Color> fireX = [Color(0xFF948EF6), Color(0xFF5446FE)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
