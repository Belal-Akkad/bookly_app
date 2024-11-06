import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_button_action_model.dart';
import 'package:flutter/material.dart';

class BookButtonAction extends StatelessWidget {
  const BookButtonAction({super.key, required this.model});

  final BookButtonActionModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveSize(context, 60),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: model.borderRadiusGeometry,
          color: model.backgrounColor,
        ),
        child: Center(
          child: Text(
            model.text,
            style: AppStyles.textStyle20(context).copyWith(
              color: model.textColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
