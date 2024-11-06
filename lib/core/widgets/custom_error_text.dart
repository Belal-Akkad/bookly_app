import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerText extends StatelessWidget {
  const CustomShimmerText({
    super.key,
    required this.text,
    this.height = 0,
  });
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: AppStyles.textStyle20(context),
          ),
        ),
      ),
    );
  }
}
