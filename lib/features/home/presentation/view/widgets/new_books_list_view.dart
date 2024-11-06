import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/new_books_list_view_item.dart';
import 'package:flutter/material.dart';

class NewBooksListView extends StatelessWidget {
  const NewBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: getResponsiveSize(context, 20)),
          child: NewBooksListViewItem(
            book: books[index],
          ),
        );
      },
    );
  }
}
