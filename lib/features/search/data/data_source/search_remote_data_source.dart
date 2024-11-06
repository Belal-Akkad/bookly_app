import 'package:bookly_app/core/entity/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchBooksRemoteData({
    required String searchValue,
    required int pageNumber,
  });
}
