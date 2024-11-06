import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_case/parm_use_case.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends ParmUseCase<List<BookEntity>, String, int> {
  final SearchRepo searchRepo;

  SearchBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failures, List<BookEntity>>> call([String? parm1, int? parm2]) {
    return searchRepo.fetchSearchBooks(
      searchValue: parm1!,
      pageNumber: parm2!,
    );
  }
}
