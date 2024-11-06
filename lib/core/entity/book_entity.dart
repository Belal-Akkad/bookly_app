import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String authorName;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final num ratingsCount;
  @HiveField(5)
  final num averageRating;
  @HiveField(6)
  final String previewLink;
  @HiveField(7)
  final String category;
  BookEntity({
    required this.category,
    required this.previewLink,
    required this.averageRating,
    required this.ratingsCount,
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.image,
  });
}
