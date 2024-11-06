import 'package:bookly_app/core/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchMainBooksLocalData({required int pageNumber});
  List<BookEntity> fetchNewBooksLocalData({required int pageNumber});
}
