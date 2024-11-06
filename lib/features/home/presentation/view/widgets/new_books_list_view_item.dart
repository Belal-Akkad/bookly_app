import 'package:bookly_app/core/constants/app_fonts.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/book_rating.dart';
import 'package:bookly_app/core/widgets/custom_cached_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewBooksListViewItem extends StatelessWidget {
  const NewBooksListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/detailsView', extra: book),
      child: SizedBox(
        height: getResponsiveSize(context, 130),
        child: Row(
          children: [
            CustomCachedBookImage(borderRadius: 16, imageUrl: book.image),
            SizedBox(width: getResponsiveSize(context, 30)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyle20(context)
                          .copyWith(fontFamily: AppFonts.gtSectraFine),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.authorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle14(context),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: AppStyles.textStyle20(context)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      BookRating(book: book),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
