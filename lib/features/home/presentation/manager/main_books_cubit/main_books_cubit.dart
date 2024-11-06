import 'package:bookly_app/features/home/domain/use_case/main_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBooksCubit extends Cubit<MainBooksState> {
  MainBooksCubit({required this.mainBooksUseCase}) : super(MainBooksInitial());

  final MainBooksUseCase mainBooksUseCase;
  Future<void> fetchMainBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(MainBooksLoading());
    } else {
      emit(MainBooksPaginationLoading());
    }
    var resulte = await mainBooksUseCase.call(pageNumber);
    resulte.fold(
      (failure) {
        emit(MainBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(MainBooksSuccess(books: books));
      },
    );
  }
}
