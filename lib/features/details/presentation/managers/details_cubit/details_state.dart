import 'package:bookly_app/core/entity/book_entity.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final List<BookEntity> books;

  DetailsSuccess({required this.books});
}

class DetailsFailure extends DetailsState {
  final String errMessage;

  DetailsFailure({required this.errMessage});
}
