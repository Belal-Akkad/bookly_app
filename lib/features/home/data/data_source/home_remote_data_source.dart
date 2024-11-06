import 'package:bookly_app/core/entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchMainBooksRemoteData({required int pageNumber});
  Future<List<BookEntity>> fetchNewBooksRemoteData({required int pageNumber});
}
