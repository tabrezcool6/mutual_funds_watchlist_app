import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

// TODO: today
class AuthHomeIndicator extends StatelessWidget {
  const AuthHomeIndicator({this.topMargin, super.key});

  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 5.0,
        width: 134,
        margin: EdgeInsets.only(top: topMargin ?? 36.0, bottom: 18.0),
        decoration: BoxDecoration(
          color: AppPallete.homeContinueText,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
