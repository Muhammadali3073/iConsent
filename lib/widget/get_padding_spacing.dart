import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Spacing {
  static EdgeInsets zero = EdgeInsets.zero;

  static EdgeInsets only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(
        left: left.toInt().h,
        right: right.toInt().h,
        top: top.toInt().h,
        bottom: bottom.toInt().h);
  }

  static EdgeInsets fromLTRB(
      double left, double top, double right, double bottom) {
    return Spacing.only(
        bottom: bottom.toInt().h,
        top: top.toInt().h,
        right: right.toInt().h,
        left: left.toInt().h);
  }

  static EdgeInsets all(double spacing) {
    return Spacing.only(
        bottom: spacing.toInt().h,
        top: spacing.toInt().h,
        right: spacing.toInt().h,
        left: spacing.toInt().h);
  }

  static EdgeInsets left(double spacing) {
    return Spacing.only(left: spacing.toInt().h);
  }

  static EdgeInsets nLeft(double spacing) {
    return Spacing.only(
        top: spacing.toInt().h,
        bottom: spacing.toInt().h,
        right: spacing.toInt().h);
  }

  static EdgeInsets top(double spacing) {
    return Spacing.only(top: spacing.toInt().h);
  }

  static EdgeInsets nTop(double spacing) {
    return Spacing.only(
        left: spacing.toInt().h,
        bottom: spacing.toInt().h,
        right: spacing.toInt().h);
  }

  static EdgeInsets right(double spacing) {
    return Spacing.only(right: spacing.toInt().h);
  }

  static EdgeInsets nRight(double spacing) {
    return Spacing.only(
        top: spacing.toInt().h,
        bottom: spacing.toInt().h,
        left: spacing.toInt().h);
  }

  static EdgeInsets bottom(double spacing) {
    return Spacing.only(bottom: spacing.toInt().h);
  }

  static EdgeInsets nBottom(double spacing) {
    return Spacing.only(
        top: spacing.toInt().h,
        left: spacing.toInt().h,
        right: spacing.toInt().h);
  }

  static EdgeInsets horizontal(double spacing) {
    return Spacing.only(left: spacing.toInt().h, right: spacing.toInt().h);
  }

  static EdgeInsets x(double spacing) {
    return Spacing.only(left: spacing.toInt().h, right: spacing.toInt().h);
  }

  static EdgeInsets xy(double xSpacing, double ySpacing) {
    return Spacing.only(
        left: xSpacing.toInt().h,
        right: xSpacing.toInt().h,
        top: ySpacing.toInt().h,
        bottom: ySpacing.toInt().h);
  }

  static EdgeInsets y(double spacing) {
    return Spacing.only(top: spacing.toInt().h, bottom: spacing.toInt().h);
  }

  static EdgeInsets vertical(double spacing) {
    return Spacing.only(top: spacing.h, bottom: spacing.h);
  }

  static EdgeInsets symmetric({double vertical = 0, double horizontal = 0}) {
    return Spacing.only(
        top: vertical.h,
        right: horizontal.h,
        left: horizontal.h,
        bottom: vertical.h);
  }

  static Widget empty() {
    return const SizedBox(width: 0, height: 0);
  }

  static double safeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double safeAreaBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
