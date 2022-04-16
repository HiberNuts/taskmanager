import 'package:get/get.dart';
import 'package:taskmanager/db/db_helper.dart';

import '../models/model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
}
