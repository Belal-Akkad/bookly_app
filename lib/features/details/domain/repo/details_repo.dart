import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepo {
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
