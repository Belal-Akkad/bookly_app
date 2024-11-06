import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchMainBooks(
      {required int pageNumber});
  Future<Either<Failures, List<BookEntity>>> fetchNewBooks(
      {required int pageNumber});
}
