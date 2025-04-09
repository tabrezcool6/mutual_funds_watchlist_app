import 'package:fl_chart/fl_chart.dart';

class LineChartTenureData{
  ///


  ///
  /// Term MAX YELLOW
  final List<FlSpot> graphSpotsYellowMAX = const [
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
  ];

  // Term MAX BLUE
  final List<FlSpot> graphSpotsBlueMAX = const [
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
  ];

  ///
  /// 3Y YELLOW
  final List<FlSpot> graphSpotsYellow3Y = const [
    FlSpot(0, 0.5),
    FlSpot(1, 0.9),
    FlSpot(2, 0.8),
    FlSpot(3, 0.4),
    FlSpot(4, 0.3),
    FlSpot(5, 0.2),
    FlSpot(6, 0.1),
    FlSpot(7, 1.1),
    FlSpot(8, 1.3),
    FlSpot(9, 1.0),
    FlSpot(10, 1.3),
    FlSpot(11, 0.9),
    FlSpot(12, 1.4),
    FlSpot(13, 1.8),
    FlSpot(16, 3.1),
    FlSpot(18, 3.7),
    FlSpot(20, 3.4),
    FlSpot(21, 2.9),
    FlSpot(22, 2.8),
  ];

  /// 3Y BLUE
  final List<FlSpot> graphSpotsBlue3Y = const [
    FlSpot(0, 0.9),
    FlSpot(1, 1.4),
    FlSpot(2, 1.8),
    FlSpot(3, 1.2),
    FlSpot(4, 1.8),
    FlSpot(5, 1.6),
    FlSpot(6, 2.1),
    FlSpot(7, 2.7),
    FlSpot(8, 3.1),
    FlSpot(9, 4),
    FlSpot(10, 4.9),
    FlSpot(11, 5.8),
    FlSpot(13, 6.5),
    FlSpot(14, 7.4),
    FlSpot(16, 8.0),
    FlSpot(18, 9.0),
    FlSpot(22, 10.8),
  ];

  ///
  /// 1Y YELLOW
  final List<FlSpot> graphSpotsYellow1Y = const [
    FlSpot(0, 0.2),
    FlSpot(2, 0.1),
    FlSpot(4, 1.5),
    FlSpot(6, 2.7),
    FlSpot(8, 3.3),
    FlSpot(10, 4.2),
    FlSpot(12, 5.1),
    FlSpot(14, 4.1),
    FlSpot(16, 4.3),
    FlSpot(18, 4.0),
    FlSpot(20, 5.3),
    FlSpot(21, 5.9),
    FlSpot(22, 5.4),
  ];

  /// 1Y BLUE
  final List<FlSpot> graphSpotsBlue1Y = const [
    FlSpot(0, 0.8),
    FlSpot(2, 1.1),
    FlSpot(4, 2.5),
    FlSpot(6, 3.7),
    FlSpot(8, 4.3),
    FlSpot(10, 5.2),
    FlSpot(12, 6.1),
    FlSpot(14, 7.1),
    FlSpot(16, 7.3),
    FlSpot(18, 9.0),
    FlSpot(20, 8.7),
    FlSpot(21, 9.9),
    FlSpot(22, 9.7),
  ];

  ///
  /// 6M YELLOW
  final List<FlSpot> graphSpotsYellow6M = const [
    FlSpot(0, 0.5),
    FlSpot(2, 0.7),
    FlSpot(4, 0.9),
    FlSpot(6, 1.7),
    FlSpot(8, 3.3),
    FlSpot(10, 4.2),
    FlSpot(12, 6.1),
    FlSpot(14, 7.1),
    FlSpot(16, 7.3),
    FlSpot(18, 9.0),
    FlSpot(20, 8.7),
    FlSpot(21, 9.9),
    FlSpot(22, 9.9),
  ];

  /// 6M BLUE
  final List<FlSpot> graphSpotsBlue6M = const [
    FlSpot(0, 0.9),
    FlSpot(2, 0.9),
    FlSpot(4, 0.2),
    FlSpot(6, 0.7),
    FlSpot(8, 1.5),
    FlSpot(10, 1.0),
    FlSpot(12, 0.9),
    FlSpot(14, 1.4),
    FlSpot(16, 1.2),
    FlSpot(18, 1.2),
    FlSpot(20, 2.4),
    FlSpot(21, 3.6),
    FlSpot(22, 4.8),
  ];

  ///
  /// 6M YELLOW
  final List<FlSpot> graphSpotsYellow3M = const [
    FlSpot(0, 0.1),
    FlSpot(2, 0.2),
    FlSpot(4, 1.0),
    FlSpot(6, 1.6),
    FlSpot(8, 1.4),
    FlSpot(10, 1.8),
  ];

  /// 6M BLUE
  final List<FlSpot> graphSpotsBlue3M = const [
    FlSpot(0, 1.6),
    FlSpot(2, 2.0),
    FlSpot(4, 1.6),
    FlSpot(6, 1.6),
    FlSpot(8, 2.0),
    FlSpot(10, 2.8),
  ];

  ///
  /// 6M YELLOW
  final List<FlSpot> graphSpotsYellow1M = const [
    FlSpot(0, 1),
    FlSpot(2, 0.5),
    FlSpot(4, 0.1),
  ];

  /// 6M BLUE
  final List<FlSpot> graphSpotsBlue1M = const [
    FlSpot(0, 0.1),
    FlSpot(2, 2.5),
    FlSpot(4, 5.0),
  ];

}