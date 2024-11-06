import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: getResponsiveSize(context, 34),
          ),
        )
      ],
    );
  }
}
