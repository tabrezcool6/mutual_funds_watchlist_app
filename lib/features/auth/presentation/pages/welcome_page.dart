import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/pages/signin_page.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_base_class.dart';

import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_home_indicator.dart';

// TODO: today
class WelcomePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const WelcomePage());
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return AuthBaseClassWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),

            Image.asset(AssetsPath.AUTH_WELOCME_LOGO),

            SizedBox(height: 46.0),

            TextStyles.size32cWhiteSemibold600('Welcome to\nDhanSaarthi !'),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextStyles.size14cDove400Regular400(
                    'One step closer to smarter\ninvesting. Let\'s begin!',
                  ),
                ),

                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, SignInPage.route());
                  },
                  backgroundColor: AppPallete.primaryColor,
                  elevation: 0.0,
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),

            AuthHomeIndicator(topMargin: 48.25),
          ],
        ),
      ),
    );
  }
}
