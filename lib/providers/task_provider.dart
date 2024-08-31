import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/task_model.dart';
import 'package:dio/dio.dart';


class TaskProvider{

  Future<Task> getTask(int userId) async {
    final response = await Dio().post(
      '${Api.baseUrl}/privilege',
      data: {
        'id': userId
      }
    );

    if(response.statusCode == 200) {
      return Task.fromJson(response.data['data']);
    } else {
      throw Exception('invalid parse data');
    }
  }
}