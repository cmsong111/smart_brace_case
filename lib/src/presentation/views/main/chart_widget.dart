import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChart mainChart({required List<double> timeData}) {
  return LineChart(
    LineChartData(
      gridData: FlGridData(
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(255, 255, 0, 0),
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(255, 0, 140, 255),
            strokeWidth: 1,
          );
        },
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
