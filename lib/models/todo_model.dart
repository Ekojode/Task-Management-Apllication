class Todo {
  int id;
  String title;
  DateTime? dueDate;
  bool isCompleted;
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
  });
}

List<Todo> todoList = [
  Todo(id: 1, title: "Clean House", dueDate: DateTime(2022, 1, 1)),
  Todo(id: 2, title: "Read Book", dueDate: DateTime(2022, 1, 1)),
  Todo(id: 3, title: "Call Friends", dueDate: DateTime(2022, 1, 1)),
  Todo(id: 4, title: "title", dueDate: DateTime(2022, 1, 1))
];
