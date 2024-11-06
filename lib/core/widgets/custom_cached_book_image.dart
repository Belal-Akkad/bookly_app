import 'package:bookly_app/core/constants/app_assets.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedBookImage extends StatelessWidget {
  const CustomCachedBookImage({super.key, this.borderRadius, required this.imageUrl});
  final double? borderRadius;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(getResponsiveSize(context, borderRadius ?? 16)),
      child: AspectRatio(
        aspectRatio: 2.4 / 4,
        child: CachedNetworkImage(
          placeholder: (context, url) => const CustomShimmerLoading(),
          errorWidget: (context, url, error) => Image.asset(
            AppAssets.imagesNotavailable,
            fit: BoxFit.fill,
          ),
          imageUrl: imageUrl ?? '',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
