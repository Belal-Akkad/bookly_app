import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/details/presentation/managers/details_cubit/details_cubit.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<DetailsCubit>(context)
        .fetchSimilarBooks(category: widget.book.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          book: widget.book,
        ),
      ),
    );
  }
}
