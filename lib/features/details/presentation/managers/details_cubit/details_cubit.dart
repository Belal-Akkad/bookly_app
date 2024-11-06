import 'package:bookly_app/features/details/domain/use_case/similar_books_use_case.dart';
import 'package:bookly_app/features/details/presentation/managers/details_cubit/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required this.similarBooksUseCase}) : super(DetailsInitial());
  final SimilarBooksUseCase similarBooksUseCase;
  void fetchSimilarBooks({
    required String category,
  }) async {
    emit(DetailsLoading());
    var resulte = await similarBooksUseCase.call(category);
    resulte.fold(
      (failure) {
        emit(DetailsFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(DetailsSuccess(books: books));
      },
    );
  }
}
