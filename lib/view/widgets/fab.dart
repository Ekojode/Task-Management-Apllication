import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/todo_controller.dart';

class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    String? todoNoter;
    DateTime? pickedDate;
    TimeOfDay? pickedTime;

    void showModalSheet() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        builder: (ctx) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  onChanged: ((value) => todoNoter = value),
                ),
                const SizedBox(height: 10),
                StatefulBuilder(
                  builder: (context, setstate) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022, 1, 1),
                                  lastDate: DateTime(2022, 12, 31),
                                );

                                if (datePicked != null &&
                                    datePicked != pickedDate) {
                                  setstate(() => pickedDate = datePicked);
                                }
                              },
                              child: const Text("Select Date"),
                            ),
                            const Spacer(),
                            Text(
                              pickedDate == null
                                  ? "No  Chosen Date"
                                  : DateFormat.yMMMEd().format(pickedDate!),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final timePicked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  initialEntryMode: TimePickerEntryMode.input,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: false),
                                      child: child!,
                                    );
                                  },
                                );

                                if (timePicked != null &&
                                    timePicked != pickedTime) {
                                  setstate(() => pickedTime = timePicked);
                                }
                              },
                              child: const Text("Select Date"),
                            ),
                            const Spacer(),
                            Text(
                              pickedTime == null
                                  ? "No  Chosen Date"
                                  : (pickedTime!.format(context)),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        if (todoNoter!.isEmpty ||
                            todoNoter == null ||
                            pickedDate == null) {
                          Get.snackbar("Error Occured",
                              '$todoNoter or $pickedDate have no value');
                          return;
                        }
                        todoController.newTodo(todoNoter!, pickedDate!);
                        Navigator.pop(context);
                        todoNoter == null;
                        pickedDate == null;
                      },
                      child: const Text(
                        "Add Todo",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: showModalSheet,
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    );
  }
}
