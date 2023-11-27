import 'package:flutter/material.dart';
import 'package:flutter_forge/theme/app_colors.dart';


class AppBoxDecoration {
  static BoxDecoration getBoxDecoration({
    double borderRadius = 12,
    Color color = Colors.white,
    double spreadRadius = 0,
    double blurRadius = 20,
    Color shadowColor = Colors.black,
    double shadowOpacity = 0.06,
    double offsetX = 0,
    double offsetY = 4,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      boxShadow: [
        BoxShadow(
          spreadRadius: spreadRadius,
          blurRadius: blurRadius,
          color: shadowColor.withOpacity(shadowOpacity),
          offset: Offset(offsetX, offsetY),
        ),
      ],
    );
  }

  static BoxDecoration customBoxDecoration({
    double borderRadius = 12,
    Color color = Colors.white,
    double spreadRadius = 0,
    double blurRadius = 20,
    Color shadowColor = AppColors.black10,
    double offsetX = 0,
    double offsetY = 4,
    BoxShape? boxShape,
    showShadow = true,
  }) {
    return BoxDecoration(
      borderRadius: boxShape == null ? BorderRadius.circular(borderRadius) : null,
      shape: boxShape ?? BoxShape.rectangle,
      color: color,
      boxShadow: [
        if (showShadow)
          BoxShadow(
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            color: shadowColor,
            offset: Offset(offsetX, offsetY),
          ),
      ],
    );
  }






}
