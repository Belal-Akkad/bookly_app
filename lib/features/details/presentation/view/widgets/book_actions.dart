import 'package:bookly_app/core/entity/book_entity.dart';
import 'package:bookly_app/core/functions/ceck_for_launch_url.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/features/details/presentation/view/widgets/book_button_action.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_button_action_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri uri = Uri.parse(book.previewLink);
        await ceckForLaunchUrl(uri, context);
      },
      child: Row(
        children: [
          Expanded(
            child: BookButtonAction(
              model: BookButtonActionModel(
                textColor: Colors.black,
                text: 'Free',
                backgrounColor: Colors.white,
                borderRadiusGeometry: BorderRadius.only(
                  bottomLeft: Radius.circular(getResponsiveSize(context, 16)),
                  topLeft: Radius.circular(
                    getResponsiveSize(context, 16),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BookButtonAction(
              model: BookButtonActionModel(
                textColor: Colors.white,
                text: 'Preview',
                backgrounColor: const Color(0xffE57864),
                borderRadiusGeometry: BorderRadius.only(
                  bottomRight: Radius.circular(getResponsiveSize(context, 16)),
                  topRight: Radius.circular(getResponsiveSize(context, 16)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
