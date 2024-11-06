import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/utilities/api_service.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchSearchBooksRemoteData({
    required String searchValue,
    required int pageNumber,
  }) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$searchValue&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
