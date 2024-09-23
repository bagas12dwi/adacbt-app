import 'dart:convert';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<User> getDetailUser(int id) async {
    final response = await http.get(Uri.parse("${Api.baseUrl}/getDetail/$id"));
    if(response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData['data']);
        } else {
      throw Exception('failed');
    }
  }
}
