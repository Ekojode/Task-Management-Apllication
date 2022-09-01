import 'dart:math';

import 'package:get/get.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final _todo = <Todo>[...todoList].obs;

  List<Todo> get todo {
    return _todo;
  }

  int randomInt() {
    var rng = Random();
    int ranNum = rng.nextInt(1000);
    int newRanNum = rng.nextInt(10000);
    int id = ranNum + newRanNum - 3;
    return id;
  }

  void newTodo(String title, DateTime date) {
    final newTodo = Todo(id: randomInt(), title: title, dueDate: date);
    _todo.add(newTodo);
  }

  void removeTodo(Todo todo) {
    // final todoRemoved = _todo.firstWhere((element) => element == todo);
    _todo.remove(todo);
  }
}
