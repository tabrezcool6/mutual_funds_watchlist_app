import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/primary_button.dart';
import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _watclistLists(),
          Spacer(),
          _addFundsToWatchListWidgets(),
          Spacer(),
          _createWatchlistButton(),
        ],
      ),
    );
  }

  /// List of all WatchLists
  Align _watclistLists() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            PrimaryButton(
              text: 'Watchlist 1',
              height: 25,
              color: AppPallete.primaryColor,
              onPressed: () {},
            ),

            SizedBox(width: 16.0),

            PrimaryButton(text: 'Watchlist 2', height: 25),
            SizedBox(width: 16.0),

            PrimaryButton(text: 'Watchlist 3', height: 25),
          ],
        ),
      ),
    );
  }

  Column _addFundsToWatchListWidgets() {
    return Column(
      children: [
        SvgPicture.asset(
          AssetsPath.WATCHLIST_ADD_LOGO_SVG,
          width: 46.0,
          height: 48.78,
        ),

        SizedBox(height: 16.0),

        TextStyles.customRegular400Text(
          'Looks like your watchlist is empty. ',
          textSize: 14.0,
          color: AppPallete.doveGrey500Color,
        ),

        SizedBox(height: 32.0),

        PrimaryButton(
          height: 36.0,
          widget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetsPath.WATCHLIST_ADD_FUND_SVG,
                // width: 11.85,
                // height: 21.88,
              ),
              SizedBox(width: 8.0),
              TextStyles.customMedium500Text(
                'ADD MUTUAL FUNDS',
                textSize: 12.0,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Create New Watchlist Button
  Align _createWatchlistButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: PrimaryButton(
        height: 40,
        color: AppPallete.primaryColor,
        isRounded: true,
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetsPath.WATCHLIST_ADD_FUND_SVG),
            SizedBox(width: 8.0),
            TextStyles.customMedium500Text('Watchlist', textSize: 12.0),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
