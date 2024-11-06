import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: const Color(0xffCFCDCD),
        highlightColor: const Color(0xffDFDEDE),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
