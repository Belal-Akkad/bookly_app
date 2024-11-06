import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/details_books_liset_view_item.dart';
import 'package:flutter/material.dart';

class DetailsBooksListView extends StatelessWidget {
  const DetailsBooksListView({super.key, required this.books});
  final List<BookEntity> books;
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
          return DetailsBooksListViewItem(book: books[index]);
        },
      ),
    );
  }
}
