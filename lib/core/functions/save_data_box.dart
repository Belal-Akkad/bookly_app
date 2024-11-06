import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:hive/hive.dart';

void saveDataBox(List<BookEntity> books, String boxName) {
  Box box = Hive.box<BookEntity>(boxName);

  box.addAll(books);
}
