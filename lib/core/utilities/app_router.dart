import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/setup_server_locator.dart';
import 'package:bookly_app/features/details/presentation/view/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:bookly_app/features/search/domain/use_case/search_books_use_case.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view/search_view.dart';
import 'package:bookly_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/detailsView',
        builder: (context, state) => BookDetailsView(
          book: state.extra as BookEntity,
        ),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            searchBooksUseCase: SearchBooksUseCase(
              searchRepo: getIt.get<SearchRepo>(),
            ),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
