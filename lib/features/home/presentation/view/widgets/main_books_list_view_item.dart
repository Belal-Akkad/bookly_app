import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_cached_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBooksListViewItem extends StatelessWidget {
  const MainBooksListViewItem({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => GoRouter.of(context).push('/detailsView', extra: book),
        child: CustomCachedBookImage(imageUrl: book.image));
  }
}
