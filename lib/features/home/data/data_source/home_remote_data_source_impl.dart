import 'package:bookly_app/core/constants/app_box.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/functions/save_data_box.dart';
import 'package:bookly_app/core/utilities/api_service.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/core/entity/book_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchMainBooksRemoteData(
      {required int pageNumber}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=world&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveDataBox(books, AppBox.mainBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewBooksRemoteData(
      {required int pageNumber}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=newest&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveDataBox(books, AppBox.newBooksBox);
    return books;
  }
}
