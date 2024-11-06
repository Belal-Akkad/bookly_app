import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/core/widgets/book_rating.dart';
import 'package:bookly_app/core/widgets/custom_cached_book_image.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/book_actions.dart';
import 'package:flutter/material.dart';

class BooksDetailsMainSection extends StatelessWidget {
  const BooksDetailsMainSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.height * 0.25,
            child: CustomCachedBookImage(imageUrl: book.image)),
        SizedBox(height: getResponsiveSize(context, 30)),
        Text(book.title,
            style: AppStyles.textStyle30(context), textAlign: TextAlign.center),
        SizedBox(height: getResponsiveSize(context, 6)),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.authorName,
            style: AppStyles.textStyle18(context).copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: getResponsiveSize(context, 6)),
        BookRating(book: book),
        SizedBox(
          height: getResponsiveSize(context, 40),
        ),
        BookActions(book: book),
      ],
    );
  }
}
