import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(searchValue: value);
      },
      cursorColor: Colors.white,
      style: AppStyles.textStyle18(context),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(getResponsiveSize(context, 15)),
        hintStyle: AppStyles.textStyle18(context),
        hintText: 'Search',
        suffixIcon: Opacity(
            opacity: 0.6,
            child: Padding(
              padding: EdgeInsets.all(getResponsiveSize(context, 15)),
              child: Icon(Icons.search, size: getResponsiveSize(context, 28)),
            )),
        enabledBorder: buildOutlineInputBorder(context),
        focusedBorder: buildOutlineInputBorder(context),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getResponsiveSize(context, 16)),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
