import 'package:bookly_app/core/constants/app_box.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/setup_server_locator.dart';
import 'package:bookly_app/core/utilities/app_router.dart';
import 'package:bookly_app/features/details/domain/repo/details_repo.dart';
import 'package:bookly_app/features/details/domain/use_case/similar_books_use_case.dart';
import 'package:bookly_app/features/details/presentation/managers/details_cubit/details_cubit.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_case/main_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_case/new_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppBox.newBooksBox);
  await Hive.openBox<BookEntity>(AppBox.mainBooksBox);

  setupServerLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBooksCubit(
            mainBooksUseCase: MainBooksUseCase(
              homeRepo: getIt.get<HomeRepo>(),
            ),
          )..fetchMainBooks(),
        ),
        BlocProvider(
          create: (context) => NewBooksCubit(
            newBooksUseCase: NewBooksUseCase(
              homeRepo: getIt.get<HomeRepo>(),
            ),
          )..fetchNewBooks(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(
            similarBooksUseCase:
                SimilarBooksUseCase(detailsRepo: getIt.get<DetailsRepo>()),
          ),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
