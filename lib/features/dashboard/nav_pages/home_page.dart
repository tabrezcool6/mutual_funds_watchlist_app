import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome User,",
            style: TextStyle(
              fontSize: 24.0,
              color: AppPallete.whiteColor,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
