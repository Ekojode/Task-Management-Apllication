import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/controllers/todo_controller.dart';
import '../../models/todo_model.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final control = Get.find<TodoController>();
    return AspectRatio(
      aspectRatio: 1,
      child: Obx(
          () => PieChart(PieChartData(sections: _chartSections(control.todo)))),
    );
  }

  List<PieChartSectionData> _chartSections(List<Todo> todos) {
    List<PieChartSectionData> list = [];

    final List<Todo> firstPart = [];
    for (var todo in todos) {
      if (todo.isCompleted) {
        firstPart.add(todo);
      }
    }
    final data1 = PieChartSectionData(
      value: (firstPart.length).toDouble(),
      color: Colors.pink,
      radius: 20,
    );

    final data2 = PieChartSectionData(
      value: (todos.length - data1.value).toDouble(),
      color: Colors.black,
      radius: 20,
    );
    list = [data1, data2];
    return list;
  }
}
