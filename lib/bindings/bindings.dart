import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
