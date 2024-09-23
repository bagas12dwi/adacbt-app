import 'package:ada_cbt/models/task_model.dart';
import 'package:ada_cbt/providers/task_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var task = Rxn<Task>();

  Future<void> getTask(int userId) async{
    try{
      var taskData = await TaskProvider().getTask(userId);
      task.value = taskData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}