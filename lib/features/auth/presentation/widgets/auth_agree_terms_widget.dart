import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

/// Auth Pages Terms of Use Widget
class AuthAgreeTermsWidget extends StatelessWidget {
  const AuthAgreeTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "By signing in, you agree to our ",
            style: TextStyles.customSizeColorTextStyle(),
            children: <TextSpan>[
              TextSpan(
                text: "T&C ",
                style: TextStyle(color: AppPallete.primaryColor),
              ),

              TextSpan(text: "and "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(color: AppPallete.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Auth Pages Greetings Widget
class AuthGreetingsWidget extends StatelessWidget {
  const AuthGreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.size28cWhiteBold700('Welcome Back,\nWe Missed You! 🎉'),

        SizedBox(height: 8.0),

        Row(
          children: [
            TextStyles.size14cWhiteRegular400('Glad to have you back at '),
            TextStyles.size14cWhiteRegular400(
              'Dhan Saarthi',
              color: AppPallete.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
