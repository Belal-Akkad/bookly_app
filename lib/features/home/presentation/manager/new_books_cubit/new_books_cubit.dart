import 'package:bookly_app/features/home/domain/use_case/new_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBooksCubit extends Cubit<NewBooksState> {
  NewBooksCubit({required this.newBooksUseCase}) : super(NewBooksInitial());

  final NewBooksUseCase newBooksUseCase;
  Future<void> fetchNewBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewBooksLoading());
    } else {
      emit(NewBooksPaginationLoading());
    }
    var resulte = await newBooksUseCase.call(pageNumber);
    resulte.fold((failure) {
      emit(NewBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(NewBooksSuccess(books: books));
    });
  }
}
