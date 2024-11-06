import 'package:bookly_app/core/constants/app_box.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchMainBooksLocalData({required int pageNumber}) {
    Box<BookEntity> box = Hive.box<BookEntity>(AppBox.mainBooksBox);
    int length = box.length;
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewBooksLocalData({required int pageNumber}) {
    Box<BookEntity> box = Hive.box<BookEntity>(AppBox.newBooksBox);
    int length = box.length;
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
