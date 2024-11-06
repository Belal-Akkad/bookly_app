import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_loading_books_image.dart';
import 'package:bookly_app/core/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';

class NewBooksLoadingListViewItem extends StatelessWidget {
  const NewBooksLoadingListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveSize(context, 130),
      child: Row(
        children: [
          const CustomLoadingBooksImage(),
          SizedBox(width: getResponsiveSize(context, 30)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmerLoading(
                  width: getResponsiveSize(context, 240),
                  height: getResponsiveSize(context, 15),
                ),
                SizedBox(height: getResponsiveSize(context, 10)),
                CustomShimmerLoading(
                  width: getResponsiveSize(context, 180),
                  height: getResponsiveSize(context, 15),
                ),
                SizedBox(height: getResponsiveSize(context, 8)),
                CustomShimmerLoading(
                  width: getResponsiveSize(context, 40),
                  height: getResponsiveSize(context, 10),
                ),
                SizedBox(height: getResponsiveSize(context, 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShimmerLoading(
                      width: getResponsiveSize(context, 50),
                      height: getResponsiveSize(context, 20),
                    ),
                    CustomShimmerLoading(
                      width: getResponsiveSize(context, 50),
                      height: getResponsiveSize(context, 15),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
