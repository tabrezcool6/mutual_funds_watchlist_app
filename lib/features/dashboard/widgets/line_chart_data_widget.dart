// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/chart_duration_button.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class LineChartDataWidget extends StatelessWidget {
  const LineChartDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  show: true,
                  spots: [
                    FlSpot(0, 4),
                    FlSpot(1, 6),
                    FlSpot(2, 5.5),
                    FlSpot(3, 11),
                    FlSpot(4, 10),
                    FlSpot(5, 15),
                    FlSpot(6, 7),
                    FlSpot(7, 13),
                    FlSpot(8, 10),
                    FlSpot(9, 17),
                    FlSpot(11, 8),
                    FlSpot(13, 16),
                    FlSpot(14, 15),
                    FlSpot(16, 18),
                    FlSpot(18, 16),
                    FlSpot(22, 18),
                  ],
                  color: AppPallete.chartLineYellow,
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppPallete.doveGrey400Color.withOpacity(0.2),
                  ),
                ),
                LineChartBarData(
                  show: true,
                  spots: [
                    FlSpot(0, 10),
                    FlSpot(1, 7),
                    FlSpot(2, 8),
                    FlSpot(4, 6),
                    FlSpot(5, 8),
                    FlSpot(6, 4),
                    FlSpot(8, 9),
                    FlSpot(10, 8),
                    FlSpot(13, 11),
                    FlSpot(14, 13),
                    FlSpot(15, 9),
                    FlSpot(17, 15),
                    FlSpot(18, 13),
                    FlSpot(22, 19),
                  ],
                  color: AppPallete.chartLineBlue,
                  isCurved: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppPallete.doveGrey400Color.withOpacity(0.2),
                  ),
                  dotData: FlDotData(show: false),
                ),
              ],
              minX: 0,
              minY: 0,
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
            ),
          ),
        ),

        /// X Axis values
        SizedBox(
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextStyles.size10cDove300Regular400('2022'),
              TextStyles.size10cDove300Regular400('2023'),
              TextStyles.size10cDove300Regular400('2024'),
              TextStyles.size10cDove300Regular400('2025'),
            ],
          ),
        ),
        
        SizedBox(height: 12.0),

        /// Chart duration selector widget
        Container(
          width: double.infinity,
          height: 34.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.91),
            border: Border.all(width: 0.41, color: AppPallete.doveGrey800Color),
          ),
          child: Row(
            children: [
              ChartDurationButton(text: '1M'),
              ChartDurationButton(text: '3M'),
              ChartDurationButton(text: '6M'),
              ChartDurationButton(text: '1Y'),
              ChartDurationButton(text: '3Y'),
              ChartDurationButton(text: 'MAX', isSelected: true),
            ],
          ),
        ),
      ],
    );
  }
}
