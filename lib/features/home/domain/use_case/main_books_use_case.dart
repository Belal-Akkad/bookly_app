import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_case/parm_use_case.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class MainBooksUseCase extends ParmUseCase<List<BookEntity>, int, void> {
  final HomeRepo homeRepo;

  MainBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call(
      [int? parm1, void parm2]) async {
    return await homeRepo.fetchMainBooks(pageNumber: parm1!);
  }
}
