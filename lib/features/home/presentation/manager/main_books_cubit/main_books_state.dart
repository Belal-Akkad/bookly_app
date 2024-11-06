import 'package:bookly_app/core/entity/book_entity.dart';

abstract class MainBooksState {}

class MainBooksInitial extends MainBooksState {}

class MainBooksLoading extends MainBooksState {}

class MainBooksPaginationLoading extends MainBooksState {}

class MainBooksSuccess extends MainBooksState {
  final List<BookEntity> books;

  MainBooksSuccess({required this.books});
}

class MainBooksFailure extends MainBooksState {
  final String errMessage;

  MainBooksFailure({required this.errMessage});
}
