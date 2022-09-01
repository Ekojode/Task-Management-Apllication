import 'package:flutter/material.dart';
import 'package:get_x_tutorial/view/widgets/chart.dart';
import 'package:get_x_tutorial/view/widgets/todo_grid.dart';
import 'package:get_x_tutorial/view/widgets/fab.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TimeOfDay? time;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          SizedBox(
            height: 200,
            child: Chart(),
          ),
          Expanded(child: TodoGrid()),
        ],
      ),
      floatingActionButton: const FAB(),
    );
  }
}
