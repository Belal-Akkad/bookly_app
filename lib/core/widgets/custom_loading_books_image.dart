import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';

class CustomLoadingBooksImage extends StatelessWidget {
  const CustomLoadingBooksImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        getResponsiveSize(context, 16),
      ),
      child: const AspectRatio(
        aspectRatio: 2.4 / 4,
        child: CustomShimmerLoading(),
      ),
    );
  }
}
