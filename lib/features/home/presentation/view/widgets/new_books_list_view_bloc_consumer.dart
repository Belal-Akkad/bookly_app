import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_state.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/new_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/new_books_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBooksListViewBlocConsumer extends StatefulWidget {
  const NewBooksListViewBlocConsumer({super.key});

  @override
  State<NewBooksListViewBlocConsumer> createState() =>
      _NewBooksListViewBlocConsumerState();
}

class _NewBooksListViewBlocConsumerState
    extends State<NewBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewBooksCubit, NewBooksState>(
      listener: (context, state) {
        if (state is NewBooksSuccess) books.addAll(state.books);
      },
      builder: (context, state) {
        if (state is NewBooksSuccess || state is NewBooksPaginationLoading) {
          return NewBooksListView(books: books);
        } else if (state is NewBooksFailure) {
          return SliverFillRemaining(
            hasScrollBody: true,
            child: CustomShimmerText(text: state.errMessage),
          );
        } else {
          return const NewBooksLoadingListView();
        }
      },
    );
  }
}
