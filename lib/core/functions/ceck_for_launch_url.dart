  import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> ceckForLaunchUrl(Uri uri, BuildContext context) async {
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'There Is No Preview Available',
            style: AppStyles.textStyle18(context),
          ),
        ),
      );
    }
  }