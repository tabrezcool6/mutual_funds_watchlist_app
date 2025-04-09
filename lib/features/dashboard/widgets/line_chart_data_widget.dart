// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/chart_duration_button.dart';
import 'package:mutual_funds_watchlist/core/constants/line_chart_data.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class LineChartDataWidget extends StatefulWidget {
  const LineChartDataWidget({super.key});

  @override
  State<LineChartDataWidget> createState() => _LineChartDataWidgetState();
}

class _LineChartDataWidgetState extends State<LineChartDataWidget> {
  late LineChartTenureData _lineChartTenureData;
  late int _activeButtonIndex;
  late List<FlSpot> _defaultGraphSpotsYellow;
  late List<FlSpot> _defaultGraphSpotsBlue;

  /// X Axis values to be displayed are mapped to the button index
  /// so that the respective values are displayed when the button is selected
  /// 0: 1M, 1: 3M, 2: 6M, 3: 1Y, 4: 3Y, 5: MAX
  final Map<int, List<String>> _lineAxisData = {
    0: List<String>.generate(16, (index) => '${index * 2}'),
    1: List<String>.generate(4, (index) => index.toString()),
    2: List<String>.generate(7, (index) => index.toString()),
    3: List<String>.generate(13, (index) => index.toString()),
    4: List<String>.generate(4, (index) => index.toString()),
    5: List<String>.generate(5, (index) => '${index + 2021}'),
  };

  @override
  void initState() {
    super.initState();
    _activeButtonIndex = 5; // Default to 'MAX'
    _lineChartTenureData = LineChartTenureData();
    _updateGraphSpots();
  }

  /// updateGraphSpots method is used to update the graph spots based on the selected button index
  /// The graph spots are mapped to the button index so that the respective values are displayed when the button is selected
  void _updateGraphSpots() {
    final tenureMapping = {
      0: [
        _lineChartTenureData.graphSpotsYellow1M,
        _lineChartTenureData.graphSpotsBlue1M,
      ],
      1: [
        _lineChartTenureData.graphSpotsYellow3M,
        _lineChartTenureData.graphSpotsBlue3M,
      ],
      2: [
        _lineChartTenureData.graphSpotsYellow6M,
        _lineChartTenureData.graphSpotsBlue6M,
      ],
      3: [
        _lineChartTenureData.graphSpotsYellow1Y,
        _lineChartTenureData.graphSpotsBlue1Y,
      ],
      4: [
        _lineChartTenureData.graphSpotsYellow3Y,
        _lineChartTenureData.graphSpotsBlue3Y,
      ],
      5: [
        _lineChartTenureData.graphSpotsYellowMAX,
        _lineChartTenureData.graphSpotsBlueMAX,
      ],
    };

    final spots = tenureMapping[_activeButtonIndex]!;
    _defaultGraphSpotsYellow = spots[0];
    _defaultGraphSpotsBlue = spots[1];
  }

  /// setActiveButton method is used to set the active button index and update the graph spots
  /// The active button index is used to determine which button is selected and which graph spots to display
  void _setActiveButton(int index) {
    setState(() {
      _activeButtonIndex = index;
      _updateGraphSpots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLineChart(),
        const SizedBox(height: 12.0),
        _buildXAxisLabels(),
        const SizedBox(height: 12.0),
        _buildDurationSelector(),
      ],
    );
  }

  /// line chart widget
  /// The line chart widget is used to display the line graph data
  Widget _buildLineChart() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              show: true,
              spots: _defaultGraphSpotsYellow,
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
              spots: _defaultGraphSpotsBlue,
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
    );
  }

  /// X Axis labels widget
  /// The X Axis labels widget is used to display the X Axis labels for the line chart which are mapped to the button index
  /// the respective values are displayed when the button is selected
  Widget _buildXAxisLabels() {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            _lineAxisData[_activeButtonIndex]!
                .map<Widget>(
                  (label) => TextStyles.size10cDove300Regular400(label),
                )
                .toList(),
      ),
    );
  }

  Widget _buildDurationSelector() {
    final lineChartTenureOptions = ['1M', '3M', '6M', '1Y', '3Y', 'MAX'];
    return Container(
      width: double.infinity,
      height: 34.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 0.52, color: AppPallete.doveGrey800Color),
      ),
      child: Row(
        children: List.generate(
          lineChartTenureOptions.length,
          (index) => ChartDurationButton(
            text: lineChartTenureOptions[index],
            isSelected: index == _activeButtonIndex,
            onTap: () => _setActiveButton(index),
          ),
        ),
      ),
    );
  }
}
