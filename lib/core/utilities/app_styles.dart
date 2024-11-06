import 'package:bookly_app/core/constants/app_fonts.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle textStyle30(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 30),
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.gtSectraFine,
      );
  static TextStyle textStyle20(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 20),
        fontFamily: AppFonts.gtSectraFine,
      );
  static TextStyle textStyle18(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 18),
        fontWeight: FontWeight.w600,
      );
  static TextStyle textStyle16(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 16),
      );
  static TextStyle textStyle14(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 14),
      );
}
