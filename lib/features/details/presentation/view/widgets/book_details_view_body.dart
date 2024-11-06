import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/book_details_main_section.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/book_details_similar_books_section.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: CustomBookDetailsAppBar()),
          SliverToBoxAdapter(child: BooksDetailsMainSection(book: book)),
          SliverToBoxAdapter(
              child: SizedBox(height: getResponsiveSize(context, 50))),
          const SliverToBoxAdapter(child: BookDetailsSimilarBooksSection()),
          SliverToBoxAdapter(
              child: SizedBox(height: getResponsiveSize(context, 30))),
        ],
      ),
    );
  }
}
