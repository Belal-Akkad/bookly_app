import 'package:bookly_app/core/entity/book_entity.dart';

abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksPaginationLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess({required this.books});
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure({required this.errMessage});
}
