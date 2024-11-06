import 'package:bookly_app/core/constants/app_assets.dart';
import 'package:bookly_app/core/functions/get_responsive_size.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class SlidingTextAnimation extends StatelessWidget {
  const SlidingTextAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: slidingAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imagesLogo,
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.fill,
            ),
            SizedBox(height: getResponsiveSize(context, 10)),
            Text(
              'Read Free Book',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle18(context)
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
