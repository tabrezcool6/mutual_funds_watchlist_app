import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppPallete.primaryColor),
    );
  }
}
