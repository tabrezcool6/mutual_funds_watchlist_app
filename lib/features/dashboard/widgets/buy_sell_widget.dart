import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/primary_button.dart';
import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

//TODO:-
class BuySellWidget extends StatelessWidget {
  const BuySellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buySellWidget(title: 'Sell', asset: AssetsPath.CHART_ARROW_SELL_SVG),

        SizedBox(width: 24.0),

        _buySellWidget(
          title: 'Invest More',
          asset: AssetsPath.CHART_ARROW_BUY_SVG,
        ),
      ],
    );
  }

  /// Buy Sell Button Widget
  Expanded _buySellWidget({required String title, required String asset}) {
    return Expanded(
      child: PrimaryButton(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyles.size14cWhiteRegular400(title),
            SizedBox(width: 6.0),
            SvgPicture.asset(asset),
          ],
        ),
        width: double.infinity,
        color: AppPallete.primaryColor,

        onPressed: () {},
      ),
    );
  }
}
