import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class Utils {
  // Static method to show Snackbar
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppPallete.signinTextFieldFilled,
          content: TextStyles.size14cWhiteRegular400(message),
        ),
      );
  }
}
