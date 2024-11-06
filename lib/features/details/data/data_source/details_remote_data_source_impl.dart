import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/utilities/api_service.dart';
import 'package:bookly_app/features/details/data/data_source/details_remote_data_source.dart';

class DetailsRemoteDataSourceImpl extends DetailsRemoteDataSource {
  final ApiService apiService;

  DetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchSimilarBooksRemoteData({
    required String category,
  }) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$category');
    List<BookEntity> books = getBooksList(data);

    return books;
  }
}
