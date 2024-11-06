import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_books_loading_list_view_item.dart';
import 'package:flutter/widgets.dart';

class SearchBooksLoadingListView extends StatelessWidget {
  const SearchBooksLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: getResponsiveSize(context, 20)),
            child: const SearchBooksLoadingListViewItem(),
          );
        },
      ),
    );
  }
}
