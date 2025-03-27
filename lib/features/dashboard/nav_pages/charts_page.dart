import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/buy_sell_widget.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/chart_line_data_repr.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/invested_current_total_widget.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/line_chart_data_widget.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.63, left: 24, right: 24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Fund title and overview
          _fundTitleAndOverview(),

          SizedBox(height: 24.0),

          /// Investment, Current Value. Total Gain Section
          InvestedCurrentTotalWidget(),

          SizedBox(height: 24),

          /// Chart Lines data representation
          ChartLineDataRepresentationWidget(),

          SizedBox(height: 16.0),

          /// Line Chart Data Section
          LineChartDataWidget(),

          SizedBox(height: 16.0),

          /// BUY and SELL Buttons Widget
          BuySellWidget(),
        ],
      ),
    );
  }

  ///
  ///
  /// Fund title and overview widget
  Column _fundTitleAndOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customSemibold600Text(
          "Motilal Oswal Midcap\nDirect Growth",
          textSize: 18.0,
        ),

        SizedBox(height: 8.0),

        _fundOverview(),
      ],
    );
  }

  ///
  ///
  /// Fund Overview widget
  Row _fundOverview() {
    return Row(
      children: [
        TextStyles.customMedium500Text(
          'Nav',
          color: AppPallete.doveGrey600Color,
        ),

        TextStyles.customMedium500Text(" ₹ 104.2", textSize: 14.0),

        SizedBox(width: 12),

        _overviewVerticalSeparator(),

        SizedBox(width: 12),

        TextStyles.customMedium500Text(
          "1D",
          color: AppPallete.doveGrey600Color,
        ),

        TextStyles.customMedium500Text(" ₹ -4.7", textSize: 14.0),

        SizedBox(width: 8),

        SvgPicture.asset(
          width: 9.04,
          height: 9.04,
          AssetsPath.CHART_ARROW_DOWN_SVG,
        ),
        SizedBox(width: 4),

        TextStyles.customMedium500Text(
          "-3.7",
          textSize: 12.0,
          color: AppPallete.valencia,
        ),
      ],
    );
  }

  ///
  ///
  ///
  Container _overviewVerticalSeparator() {
    return Container(
      height: 17.0,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.75, color: AppPallete.doveGrey400Color),
        ),
      ),
    );
  }
}
