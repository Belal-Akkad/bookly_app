import 'package:bookly_app/core/entity/book_entity.dart';

abstract class NewBooksState {}

class NewBooksInitial extends NewBooksState {}

class NewBooksLoading extends NewBooksState {}

class NewBooksPaginationLoading extends NewBooksState {}

class NewBooksSuccess extends NewBooksState {
  final List<BookEntity> books;

  NewBooksSuccess({required this.books});
}

class NewBooksFailure extends NewBooksState {
  final String errMessage;

  NewBooksFailure({required this.errMessage});
}
