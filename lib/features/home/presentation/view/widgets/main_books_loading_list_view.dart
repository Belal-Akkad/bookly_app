import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_loading_books_image.dart';
import 'package:flutter/material.dart';

class MainBooksLoadingListView extends StatelessWidget {
  const MainBooksLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getResponsiveSize(context, 8),
            ),
            child: const CustomLoadingBooksImage(),
          );
        },
      ),
    );
  }
}
