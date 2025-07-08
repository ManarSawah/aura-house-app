import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;

  double wp(double percent) => w * percent;
  double hp(double percent) => h * percent;

  bool get isSmallScreen => w < 360;
  bool get isTablet => w >= 600 && w < 1024;
  bool get isLargeScreen => w >= 1024;

  double get safeTop => MediaQuery.of(this).padding.top;
  double get safeBottom => MediaQuery.of(this).padding.bottom;

  double get textScale => MediaQuery.textScalerOf(this).scale(1.0);
}
