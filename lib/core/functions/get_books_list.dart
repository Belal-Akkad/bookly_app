import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/entity/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (Map<String, dynamic> book in data['items']) {
    books.add(BookModel.fromJson(book));
  }


  return books;
}
