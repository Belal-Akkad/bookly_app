import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookEntity>>> fetchSearchBooks({
    required String searchValue,
    required int pageNumber,
  });
}
