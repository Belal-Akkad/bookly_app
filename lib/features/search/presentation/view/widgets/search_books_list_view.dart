import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_books_list_view_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListView extends StatefulWidget {
  const SearchBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SearchBooksListView> createState() => _SearchBooksListViewState();
}

class _SearchBooksListViewState extends State<SearchBooksListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    double currentPosition = scrollController.position.pixels;
    double maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        String searchValue =
            BlocProvider.of<SearchBooksCubit>(context).searchValue;
        await BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(searchValue: searchValue, pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: getResponsiveSize(context, 20)),
            child: SearchBooksListViewItem(
              book: widget.books[index],
            ),
          );
        },
      ),
    );
  }
}
