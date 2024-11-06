import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ParmUseCase<Type, Parm1, Parm2> {
  Future<Either<Failures, Type>> call([Parm1 parm1, Parm2 parm2]);
}
