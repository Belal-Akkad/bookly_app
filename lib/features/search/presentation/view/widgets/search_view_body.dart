import 'package:bookly_app/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(height: 30),
          SearchBooksListViewBlocConsumer(),
        ],
      ),
    );
  }
}
