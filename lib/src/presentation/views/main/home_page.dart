import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_brace_case/src/presentation/views/main/chart_widget.dart';
import 'package:smart_brace_case/src/presentation/views/main/timer_widget.dart';
import 'package:smart_brace_case/src/presentation/views/main/todo_widget.dart';
import 'package:smart_brace_case/src/presentation/views/main/toggle_switch.dart';

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              children: <StaggeredGridTile>[
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                      child: mainChart(
                          timeData: [7.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])),
                ),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: ToggleSwitch(),
                ),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: MyTimer(),
                ),
                const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: TodoCard()),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("내 기기 찾기",
                                  style: TextStyle(fontSize: 15)),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_sharp),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          height: 120,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/naver_map.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
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
      ),
    );
  }
}
