import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> clearBox(String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.clear();
}
