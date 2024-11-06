import 'package:bookly_app/core/constants/app_fonts.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/details_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class BookDetailsSimilarBooksSection extends StatelessWidget {
  const BookDetailsSimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Also Like',
          style: AppStyles.textStyle16(context).copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.gtSectraFine,
          ),
        ),
        SizedBox(height: getResponsiveSize(context, 16)),
        const DetailsBooksListViewBlocConsumer(),
      ],
    );
  }
}
