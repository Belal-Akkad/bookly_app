import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failures, List<BookEntity>>> fetchMainBooks(
      {required int pageNumber}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchMainBooksLocalData(
        pageNumber: pageNumber,
      );
      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await homeRemoteDataSource.fetchMainBooksRemoteData(
            pageNumber: pageNumber);
        return right(books);
      }
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(ServerFailure(errMessage: error.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewBooks(
      {required int pageNumber}) async {
    try {
      List<BookEntity> books;
      books =
          homeLocalDataSource.fetchNewBooksLocalData(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await homeRemoteDataSource.fetchNewBooksRemoteData(
            pageNumber: pageNumber);
        return right(books);
      }
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(ServerFailure(errMessage: error.toString()));
      }
    }
  }
}
