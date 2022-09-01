import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class TodoGrid extends StatelessWidget {
  // final List<Todo> todo;
  const TodoGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contol = Get.find<TodoController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: contol.todo.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                title: Text(contol.todo[i].title),
                subtitle: Text(
                  DateFormat.yMMMEd().format(contol.todo[i].dueDate!),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text(
                              "Are you sure you want to delete this todo!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                              onPressed: () {
                                contol.removeTodo(contol.todo[i]);
                                Navigator.pop(context);
                              },
                              child: const Text("Okay",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
