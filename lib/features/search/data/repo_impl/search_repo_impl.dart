import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl({required this.searchRemoteDataSource});
  final SearchRemoteDataSource searchRemoteDataSource;
  @override
  Future<Either<Failures, List<BookEntity>>> fetchSearchBooks(
      {required String searchValue, required int pageNumber}) async {
    try {
      List<BookEntity> books;
      books = await searchRemoteDataSource.fetchSearchBooksRemoteData(
          searchValue: searchValue, pageNumber: pageNumber);
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
