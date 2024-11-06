import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/main_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBooksListView extends StatefulWidget {
  const MainBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<MainBooksListView> createState() => _MainBooksListViewState();
}

class _MainBooksListViewState extends State<MainBooksListView> {
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
    if (currentPosition >= 0.8 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<MainBooksCubit>(context)
            .fetchMainBooks(pageNumber: nextPage++);
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getResponsiveSize(context, 8),
            ),
            child: MainBooksListViewItem(book: widget.books[index]),
          );
        },
      ),
    );
  }
}
