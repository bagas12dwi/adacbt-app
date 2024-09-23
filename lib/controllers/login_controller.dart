import 'dart:convert';
import 'dart:io';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/helpers/shared_prefs.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/providers/user_provider.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:ada_cbt/views/screens/splash/splash.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController namaController;
  late TextEditingController phoneController;
  var status_code;
  var user = Rxn<User>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namaController = TextEditingController();
    phoneController = TextEditingController();
  }

  void setUser(User newUser) {
    user.value = newUser;
  }

  checkUser() async{
    var users = await SharedPref().getUser();
    if(users != null){
      Get.off(() => Home(id: json.decode(users)['id']));
    } else {
      Get.off(() => const Splash());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      // Make API call to login
      // Assume you have Dio configured and the necessary imports

      Dio dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        '${Api.baseUrl}/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var userData = response.data['data'][0];
        User loggedInUser = User.fromJson(userData);
        if(loggedInUser.isActive == 1) {
          setUser(loggedInUser);
          await SharedPref().storeUser(json.encode(loggedInUser));
        }
      } else {
        // Handle login failure
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error during login: $e');
      }
      rethrow; // Rethrow the exception to let the UI handle it
    }
  }

  Future<void> register(String email, String password, String fullName, String phoneNumber) async{
    try{
      Dio dio = Dio();

      var response = await dio.post(
        '${Api.baseUrl}/register',
        data: {
          'email': email,
          'password': password,
          'full_name': fullName,
          'phone_number': phoneNumber
        }
      );

      if (response.statusCode == 200){
        var userData = response.data['data'][0];
        User registeredUser = User.fromJson(userData);
        if(registeredUser.isActive == 1){
          setUser(registeredUser);
          await SharedPref().storeUser(json.encode(registeredUser));
        }
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e){
      if (kDebugMode) {
        print('Error during login: $e');
      }
      rethrow;
    }
  }

  Future<void> getDetail(int id) async {
    try {
      var userData = await UserProvider().getDetailUser(id);
      user.value = userData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async{
    await SharedPref().removeUser();
    Get.offAll(()=> const Splash());
  }
}