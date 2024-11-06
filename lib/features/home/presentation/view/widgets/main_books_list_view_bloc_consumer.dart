import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_state.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/main_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/main_books_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBooksListViewBlocConsumer extends StatefulWidget {
  const MainBooksListViewBlocConsumer({super.key});

  @override
  State<MainBooksListViewBlocConsumer> createState() =>
      _MainBooksListViewBlocConsumerState();
}

class _MainBooksListViewBlocConsumerState
    extends State<MainBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBooksCubit, MainBooksState>(
      listener: (context, state) {
        if (state is MainBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is MainBooksSuccess || state is MainBooksPaginationLoading) {
          return MainBooksListView(books: books);
        } else if (state is MainBooksFailure) {
          return CustomShimmerText(
              height: MediaQuery.of(context).size.height * 0.3,
              text: state.errMessage);
        } else {
          return const MainBooksLoadingListView();
        }
      },
    );
  }
}
