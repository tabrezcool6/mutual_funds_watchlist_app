import 'package:flutter/widgets.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class ChartLineDataRepresentationWidget extends StatelessWidget {
  const ChartLineDataRepresentationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(4.91),
      border: Border.all(width: 0.41, color: AppPallete.doveGrey800Color),
    );

    ///
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _graphLineRepresentor(
              title: "Your Investments",
              value: "-19.75%",
              color: AppPallete.chartLineBlue,
            ),
            SizedBox(height: 4),
            _graphLineRepresentor(
              title: "Nifty Midcap 150",
              value: "-19.75%",
              color: AppPallete.chartLineYellow,
            ),
          ],
        ),

        Container(
          width: 47.0,
          height: 28,
          decoration: boxDecoration,
          child: Center(
            child: TextStyles.customRegular400Text(
              "NAV",
              textSize: 9.82,
              color: AppPallete.doveGrey500Color,
            ),
          ),
        ),
      ],
    );
  }

  /// Graph Line Data Representor
  Row _graphLineRepresentor({
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        _horizontalColorIndicator(color),

        SizedBox(width: 9.0),

        TextStyles.customMedium500Text(title, color: color),

        SizedBox(width: 9.0),

        TextStyles.customMedium500Text(value, textSize: 12.0, color: color),
      ],
    );
  }

  Container _horizontalColorIndicator(Color color) {
    return Container(
      width: 16,
      height: 1,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: color)),
      ),
    );
  }
}
