import 'dart:convert';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<User> getDetailUser(int id) async {
    final response = await http.get(Uri.parse("${Api.baseUrl}/getDetailAkun/$id"));
    if(response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if(responseData != null) {
        return User.fromJson(responseData['data']);
      } else {
        throw Exception('invalid data parse');
      }
    } else {
      throw Exception('failed');
    }
  }
}
