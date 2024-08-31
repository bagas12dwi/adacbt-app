import 'dart:io';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/terapi_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TerapiController extends GetxController{
  var terapi = Rxn<Terapi>();
  RxBool isLoading = false.obs;

  void setTerapi(Terapi newTerapi){
    terapi.value = newTerapi;
  }

  Future<void> storeTerapi(int userId, String catatan1, String catatan2, String catatan3, String catatan4, String catatan5, String catatan6, String pertanyaan) async{
    try {

      Dio dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        '${Api.baseUrl}/terapi',
        data: {
          'user_id': userId,
          'catatan1': catatan1,
          'catatan2': catatan2,
          'catatan3': catatan3,
          'catatan4': catatan4,
          'catatan5': catatan5,
          'catatan6': catatan6,
          'pertanyaan': pertanyaan
        }
      );

      if (response.statusCode == 200) {
        var terapiData = response.data['data'];
        Terapi terapiDataNew = Terapi.fromJson(terapiData);
        setTerapi(terapiDataNew);
      } else {
        throw Exception('Failed store data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during save data: $e');
      }
      rethrow;
    }
  }
}