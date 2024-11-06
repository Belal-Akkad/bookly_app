import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/features/details/presentation/managers/details_cubit/details_cubit.dart';
import 'package:bookly_app/features/details/presentation/managers/details_cubit/details_state.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/details_books_list_view.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/details_books_loadind_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBooksListViewBlocConsumer extends StatelessWidget {
  const DetailsBooksListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DetailsSuccess) {
          return DetailsBooksListView(books: state.books);
        } else if (state is DetailsFailure) {
          return CustomShimmerText(
            text: state.errMessage,
            height: MediaQuery.of(context).size.height * 0.15,
          );
        } else {
          return const DetailtsBooksLoadingListView();
        }
      },
    );
  }
}
