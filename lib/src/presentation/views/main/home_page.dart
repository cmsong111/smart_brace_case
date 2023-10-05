import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Brace Case")),
      body: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 2,
            children: <StaggeredGridTile>[
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.green,
                  child: LineChart(
                    mainChart(),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.blue,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.purple,
                  child: Center(
                    child: Text("Grpup 1"),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Grpup 1"),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.cyan,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.orange,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

LineChartData mainChart() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Color(0xff37434d),
          strokeWidth: 0.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 7,
    minY: 0,
    maxY: 10,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(1, 2),
          FlSpot(2, 5),
          FlSpot(3, 3),
          FlSpot(4, 4),
          FlSpot(5, 3),
          FlSpot(6, 4),
          FlSpot(7, 6),
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
  );
}
