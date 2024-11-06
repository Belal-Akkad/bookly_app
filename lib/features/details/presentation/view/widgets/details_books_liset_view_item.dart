import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/widgets/custom_cached_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsBooksListViewItem extends StatelessWidget {
  const DetailsBooksListViewItem({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/detailsView', extra: book),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getResponsiveSize(context, 5),
        ),
        child: CustomCachedBookImage(
          borderRadius: 16,
          imageUrl: book.image,
        ),
      ),
    );
  }
}
