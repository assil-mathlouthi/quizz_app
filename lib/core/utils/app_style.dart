import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle fontBold32(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
    );
  }

  static TextStyle fontRegular20(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  var width = MediaQuery.sizeOf(context).width;
  double scaleFactor = width / 390;
  double responsiveFontSize = fontSize * scaleFactor;
  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}
