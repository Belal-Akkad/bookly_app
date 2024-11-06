import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: getResponsiveSize(context, 18),
        ),
        SizedBox(width: getResponsiveSize(context, 6)),
        FittedBox(
          child: Text(
            '${book.ratingsCount}',
            style: AppStyles.textStyle16(context),
          ),
        ),
        SizedBox(width: getResponsiveSize(context, 6)),
        Text(
          '(${book.averageRating})',
          style: AppStyles.textStyle14(context)
              .copyWith(color: const Color(0xFF707070)),
        )
      ],
    );
  }
}
