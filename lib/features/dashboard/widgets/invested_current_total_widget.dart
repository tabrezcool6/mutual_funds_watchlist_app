import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class InvestedCurrentTotalWidget extends StatelessWidget {
  const InvestedCurrentTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Border Decoration
    var boxDecoration = BoxDecoration(
      border: Border.all(color: AppPallete.doveGrey900Color, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );

    ///
    return Container(
      height: 64,
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _singleEntityMethod(title: "Invested", value: "₹1.5k"),

          _verticalSeparator(),

          _singleEntityMethod(title: "Current Value", value: "₹1.28k"),

          _verticalSeparator(),

          _singleEntityMethod(
            title: "Total Gain",
            value: "₹-220.16",
            downBy: "-14.7",
          ),
        ],
      ),
    );
  }

  ///
  ///
  /// Sinlge Entity Widget
  Column _singleEntityMethod({
    required String title,
    required String value,
    String? downBy,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextStyles.customMedium500Text(
          title,
          textSize: 14.0,
          color: AppPallete.doveGrey500Color,
        ),

        SizedBox(height: 4.0),

        Row(
          children: [
            TextStyles.customSemibold600Text(value),

            if (downBy != null) ...[
              SizedBox(width: 8),

              SvgPicture.asset(
                width: 9.04,
                height: 9.04,
                AssetsPath.CHART_ARROW_DOWN_SVG,
              ),
              SizedBox(width: 4),

              TextStyles.customMedium500Text(
                downBy,
                textSize: 12.0,
                color: AppPallete.valencia,
              ),
            ],
          ],
        ),
      ],
    );
  }

  ///
  ///
  /// Vertical Separator line
  Container _verticalSeparator() {
    return Container(
      height: 32.0,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppPallete.doveGrey400Color),
      ),
    );
  }

  ///
}
