import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/details/data/data_source/details_remote_data_source.dart';
import 'package:bookly_app/features/details/domain/repo/details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepoImpl extends DetailsRepo {
  DetailsRepoImpl({required this.detailsBooksRemoteDataSource});
  final DetailsRemoteDataSource detailsBooksRemoteDataSource;

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      List<BookEntity> books;
      books = await detailsBooksRemoteDataSource.fetchSimilarBooksRemoteData(
        category: category,
      );
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(ServerFailure(errMessage: error.toString()));
      }
    }
  }
}
