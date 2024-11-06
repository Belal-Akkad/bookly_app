import 'package:bookly_app/core/constants/app_box.dart';
import 'package:bookly_app/core/functions/clear_box.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/home/presentation/manager/main_books_cubit/main_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/new_books_cubit/new_books_state.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/main_books_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/new_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int nextPage = 1;
  bool isLoading = false;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    double currentPosition = scrollController.position.pixels;
    double maxPosition = scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.8 * maxPosition) {
      if (!isLoading &&
          BlocProvider.of<NewBooksCubit>(context).state is! NewBooksLoading) {
        isLoading = true;
        await BlocProvider.of<NewBooksCubit>(context)
            .fetchNewBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        await onRefresh(context);
      },
      color: const Color(0xff150E2E),
      backgroundColor: Colors.white,
      animSpeedFactor: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: CustomHomeAppBar()),
            const SliverToBoxAdapter(child: MainBooksListViewBlocConsumer()),
            SliverToBoxAdapter(
                child: SizedBox(height: getResponsiveSize(context, 20))),
            SliverToBoxAdapter(
                child:
                    Text('Best Seller', style: AppStyles.textStyle18(context))),
            SliverToBoxAdapter(
                child: SizedBox(height: getResponsiveSize(context, 20))),
            const NewBooksListViewBlocConsumer(),
          ],
        ),
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    await clearBox(AppBox.mainBooksBox);
    await clearBox(AppBox.newBooksBox);
    BlocProvider.of<MainBooksCubit>(context).fetchMainBooks();
    BlocProvider.of<NewBooksCubit>(context).fetchNewBooks();
    // await Future.delayed(const Duration(seconds: 2));
  }
}
