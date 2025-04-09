import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/chart_duration_button.dart';
import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  static const double _sliderMaxValue = 10.0;
  static const double _sliderMinValue = 1.0;

  double _sliderValue = _sliderMaxValue;

  /// defult value to be set for the bars
  final List<double> _inactiveDefaults = [0.9, 2.0, 1.5];
  final List<double> _activeDefaults = [1.19, 3.63, 4.55];

  /// values to be set for the bars based on the slider value
  late List<double> _inactiveValues;
  late List<double> _activeValues;

  @override
  void initState() {
    super.initState();
    _updateBarChartData();
  }

  /// Updates bar chart data based on the slider value
  /// The values are multiplied by the slider value to get the final values
  /// for the bars
  /// The values are set to the _inactiveValues and _activeValues lists
  void _updateBarChartData() {
    _inactiveValues =
        _inactiveDefaults.map((value) => value * _sliderValue).toList();
    _activeValues =
        _activeDefaults.map((value) => value * _sliderValue).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 46.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14.36),
        decoration: BoxDecoration(
          color: AppPallete.doveGrey950Color,
          border: Border.all(width: 0.45, color: AppPallete.doveGrey600Color),
          borderRadius: BorderRadius.circular(7.18),
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildSlider(context),
            _buildPastFundPerformance(),
            _buildBarChart(),
          ],
        ),
      ),
    );
  }

  /// Builds the header section with invested amount and SIP options
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildInvestedAmount(), _buildSipOptions()],
    );
  }

  /// Builds the slider widget
  Widget _buildSlider(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(trackHeight: 2.69),
          child: Slider(
            value: _sliderValue,
            min: _sliderMinValue,
            max: _sliderMaxValue,
            thumbColor: AppPallete.slideractiveColor,
            activeColor: AppPallete.slideractiveColor,
            inactiveColor: AppPallete.sliderInactiveColor,
            label: _sliderValue.round().toString(),
            onChanged: (double newValue) {
              _sliderValue = newValue;
              _updateBarChartData();
            },
          ),
        ),
        const SizedBox(height: 3.59),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyles.customRegular400Text("₹ ${_sliderMinValue.toInt()} L"),
            TextStyles.customRegular400Text("₹ ${_sliderMaxValue.toInt()} L"),
          ],
        ),
      ],
    );
  }

  /// Builds the past fund performance section
  Widget _buildPastFundPerformance() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customSemibold600Text('This Fund’s past returns'),
              TextStyles.customMedium500Text(
                'Profit % (Absolute Return)',
                color: AppPallete.doveGrey600Color,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextStyles.customSemibold600Text(
                '₹ ${(3.6 * _sliderValue).toStringAsFixed(2)} L',
                color: AppPallete.apple500Color,
              ),
              TextStyles.customMedium500Text(
                '355.3%',
                color: AppPallete.doveGrey200Color,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the bar chart
  Widget _buildBarChart() {
    var axisTitles = AxisTitles(sideTitles: SideTitles(showTitles: false));
    return Padding(
      padding: const EdgeInsets.only(top: 32.32, bottom: 21.54),
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.32),
          child: Column(
            children: [
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    maxY: _activeDefaults.last * _sliderMaxValue,
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipPadding: EdgeInsets.zero,
                        tooltipMargin: 0,
                        getTooltipColor: (_) => AppPallete.transparentColor,
                        getTooltipItem: (_, __, rod, ___) {
                          return BarTooltipItem(
                            "₹${rod.toY.toStringAsFixed(2)}L",
                            TextStyles.customSizeColorTextStyle(
                              weight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: axisTitles,
                      rightTitles: axisTitles,
                      topTitles: axisTitles,
                      bottomTitles: axisTitles,
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        bottom: BorderSide(
                          width: 0.9,
                          color: AppPallete.whiteColor,
                        ),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    barGroups: List.generate(
                      _activeValues.length,
                      (index) => _buildBarGroupData(
                        _activeValues[index],
                        _inactiveValues[index],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.39),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyles.customMedium500Text('Saving A/C'),
                    TextStyles.customMedium500Text('Category Avg.'),
                    TextStyles.customMedium500Text('Direct Plan'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a single bar group data
  BarChartGroupData _buildBarGroupData(double active, double inactive) {
    return BarChartGroupData(
      x: 0,
      groupVertically: true,
      showingTooltipIndicators: [0],
      barRods: [
        BarChartRodData(
          toY: active,
          fromY: inactive,
          width: 41.29,
          borderRadius: BorderRadius.zero,
          color: AppPallete.apple600Color,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            color: AppPallete.doveGrey900Color,
            toY: inactive,
            fromY: 0,
          ),
        ),
      ],
    );
  }

  /// Builds the invested amount section
  Widget _buildInvestedAmount() {
    return Wrap(
      children: [
        TextStyles.customSemibold600Text('If you invested'),
        const SizedBox(width: 5.39),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.9,
                color: AppPallete.doveGrey600Color,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextStyles.customSemibold600Text('₹ ${_sliderValue.toStringAsFixed(2)} L'),
              const SizedBox(width: 7.18),
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(AssetsPath.EDIT_PENCIL),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the SIP options section
  Widget _buildSipOptions() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.59),
      width: 115,
      decoration: BoxDecoration(
        color: AppPallete.doveGrey950Color,
        border: Border.all(width: 0.45, color: AppPallete.doveGrey600Color),
        borderRadius: BorderRadius.circular(3.59),
      ),
      child: Row(
        children: [
          ChartDurationButton(
            text: '1-Time',
            isSelected: true,
            textSize: 8.98,
            onTap: () {},
          ),
          ChartDurationButton(text: 'Monthly SIP', textSize: 8.98),
        ],
      ),
    );
  }
}
