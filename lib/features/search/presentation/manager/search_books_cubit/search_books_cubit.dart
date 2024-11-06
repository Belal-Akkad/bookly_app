import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/search/domain/use_case/search_books_use_case.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit({required this.searchBooksUseCase})
      : super(SearchBooksInitial());
  final SearchBooksUseCase searchBooksUseCase;
  late String searchValue;
  Future<void> fetchSearchBooks(
      {required String searchValue, int pageNumber = 0}) async {
    this.searchValue = searchValue;
    if (pageNumber == 0) {
      emit(SearchBooksLoading());
    } else {
      emit(SearchBooksPaginationLoading());
    }

    Either<Failures, List<BookEntity>> resulte =
        await searchBooksUseCase.call(searchValue, pageNumber);
    resulte.fold((failure) {
      emit(SearchBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
