import 'dart:convert';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/providers/user_provider.dart';
import 'package:ada_cbt/views/screens/auth/login.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController namaController;
  var status_code;
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namaController = TextEditingController();
  }

  void login() async {
    try {
      var user = User(email: emailController.text, password: passwordController.text);
      var response = await http.post(Uri.parse('${Api.baseUrl}/login'),
          body: json.encode(user.toJson()),
          headers: {'Content-type':'application/json'}
      );
      if (response.statusCode == 200){
        var responseData = json.decode(response.body);
        status_code = responseData['status_code'];
        if(status_code == 200){
          return Get.offAll( () => Home(id: responseData['data']['id'],) );
        } else {
          return status_code;
        }
      }

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void register() async {
    try{
      var user = User(email: emailController.text, password: passwordController.text, nama: namaController.text);
      var response = await http.post(Uri.parse('${Api.baseUrl}/register'),
          body: json.encode(user.toJson()),
          headers: {'Content-type':'application/json'}
      );

      if(response.statusCode == 200) {
        var responseData = json.decode(response.body);
        status_code = responseData['status_code'];
        if(status_code == 200){
          return Get.offAll(() => Login());
        } else {
          return status_code;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getDetail(int id) async {
    try {
      var userData = await UserProvider().getDetailUser(id);
      user.value = userData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}