import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/new_books_loading_list_view_item.dart';
import 'package:flutter/material.dart';

class NewBooksLoadingListView extends StatelessWidget {
  const NewBooksLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: getResponsiveSize(context, 20)),
          child: const NewBooksLoadingListViewItem(),
        );
      },
    );
  }
}
