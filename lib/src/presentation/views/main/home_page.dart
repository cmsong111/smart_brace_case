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
            children: const <StaggeredGridTile>[
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.green,
                  child: Center(
                    child: Text("Grpup 1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.blue,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.purple,
                  child: Center(
                    child: Text("Grpup 1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Grpup 1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.cyan,
                  child: Center(
                    child: Text("1"),
                  ),
                ),
              ),
              StaggeredGridTile.count(
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
