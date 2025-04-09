import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/bar_chart_widget.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/buy_sell_widget.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/chart_line_data_repr.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/invested_current_total_widget.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/line_chart_data_widget.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ).copyWith(top: 16.63),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Fund title and overview
            const FundTitleAndOverview(),
            const SizedBox(height: 24.0),

            /// Investment, Current Value, Total Gain Section
            const InvestedCurrentTotalWidget(),
            const SizedBox(height: 24),

            /// Chart Lines data representation
            const ChartLineDataRepresentationWidget(),
            const SizedBox(height: 16.0),

            /// Line Chart Data Section
            const LineChartDataWidget(),
            const SizedBox(height: 46.0),

            /// Bar Chart Section
            const BarChartWidget(),
            const SizedBox(height: 16.0),

            /// BUY and SELL Buttons Widget
            const BuySellWidget(),
          ],
        ),
      ),
    );
  }
}

/// Fund title and overview widget
class FundTitleAndOverview extends StatelessWidget {
  const FundTitleAndOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customSemibold600Text(
          "Motilal Oswal Midcap\nDirect Growth",
          textSize: 18.0,
        ),
        const SizedBox(height: 8.0),
        const FundOverview(),
      ],
    );
  }
}

/// Fund Overview widget
class FundOverview extends StatelessWidget {
  const FundOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _overviewText('Nav', AppPallete.doveGrey600Color),
        _overviewText(" ₹ 104.2", null),
        const SizedBox(width: 12),
        const OverviewVerticalSeparator(),
        const SizedBox(width: 12),
        _overviewText("1D", AppPallete.doveGrey600Color),
        _overviewText(" ₹ -4.7", null),
        const SizedBox(width: 8),
        SvgPicture.asset(
          width: 9.04,
          height: 9.04,
          AssetsPath.CHART_ARROW_DOWN_SVG,
        ),
        const SizedBox(width: 4),
        _overviewText("-3.7", AppPallete.valencia, textSize: 12.0),
      ],
    );
  }

  Widget _overviewText(String text, Color? color, {double textSize = 14.0}) {
    return TextStyles.customMedium500Text(
      text,
      color: color,
      textSize: textSize,
    );
  }
}

/// Vertical separator widget
class OverviewVerticalSeparator extends StatelessWidget {
  const OverviewVerticalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.0,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.75, color: AppPallete.doveGrey400Color),
        ),
      ),
    );
  }
}
