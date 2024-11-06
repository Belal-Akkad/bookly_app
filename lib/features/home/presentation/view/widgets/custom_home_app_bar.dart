import 'package:bookly_app/core/constants/app_assets.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getResponsiveSize(context, 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.imagesLogo,
            height: getResponsiveSize(context, 22),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchView');
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: getResponsiveSize(context, 34),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
