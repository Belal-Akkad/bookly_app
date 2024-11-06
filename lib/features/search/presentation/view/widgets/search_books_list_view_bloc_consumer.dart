import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_state.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_books_list_view.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_books_loading_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListViewBlocConsumer extends StatefulWidget {
  const SearchBooksListViewBlocConsumer({super.key});

  @override
  State<SearchBooksListViewBlocConsumer> createState() =>
      _SearchBooksListViewBlocConsumerState();
}

class _SearchBooksListViewBlocConsumerState
    extends State<SearchBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {
        if (state is SearchBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return const Expanded(child: CustomShimmerText(text: 'No Resulte'));
        }
        if (state is SearchBooksSuccess ||
            state is SearchBooksPaginationLoading) {
          return Expanded(child: SearchBooksListView(books: books));
        } else if (state is SearchBooksFailure) {
          return Expanded(child: CustomShimmerText(text: state.errMessage));
        } else {
          books.clear();
          return const SearchBooksLoadingListView();
        }
      },
    );
  }
}
