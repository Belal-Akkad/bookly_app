import 'package:bookly_app/core/entity/book_entity.dart';

abstract class DetailsRemoteDataSource {
  Future<List<BookEntity>> fetchSimilarBooksRemoteData({
    required String category,
  });
}
