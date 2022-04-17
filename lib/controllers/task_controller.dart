import 'package:get/get.dart';
import 'package:taskmanager/db/db_helper.dart';

import '../models/model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void delete(Task task) {
   var val= DBHelper.delete(task);
  }
}
