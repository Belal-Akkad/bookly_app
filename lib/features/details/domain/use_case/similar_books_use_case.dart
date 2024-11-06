import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_case/parm_use_case.dart';
import 'package:bookly_app/features/details/domain/repo/details_repo.dart';
import 'package:dartz/dartz.dart';

class SimilarBooksUseCase extends ParmUseCase<List<BookEntity>, String, int> {
  final DetailsRepo detailsRepo;

  SimilarBooksUseCase({required this.detailsRepo});
  @override
  Future<Either<Failures, List<BookEntity>>> call(
      [String? parm1, void parm2]) async {
    return await detailsRepo.fetchSimilarBooks(
      category: parm1!,
    );
  }
}
