import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, double size) {
  double width = MediaQuery.of(context).size.width;
  double scaleFactor = width / 550;
  double responsiveFontSized = size * scaleFactor;
  double lowerLimit = size * 0.5;
  double upperLimit = size * 2;
  return responsiveFontSized.clamp(lowerLimit, upperLimit);
}
