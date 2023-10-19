import 'package:fl_chart/fl_chart.dart';

LineChart mainChart({required List<double> timeData}) {
  return LineChart(
    LineChartData(
      gridData: const FlGridData(
        drawVerticalLine: true,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, timeData[0]),
            FlSpot(1, timeData[1]),
            FlSpot(2, timeData[2]),
            FlSpot(3, timeData[3]),
            FlSpot(4, timeData[4]),
            FlSpot(5, timeData[5]),
            FlSpot(6, timeData[6]),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    ),
  );
}
