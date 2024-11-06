import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_loading_books_image.dart';
import 'package:flutter/material.dart';

class DetailtsBooksLoadingListView extends StatelessWidget {
  const DetailtsBooksLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getResponsiveSize(context, 5),
            ),
            child: const CustomLoadingBooksImage(),
          );
        },
      ),
    );
  }
}
