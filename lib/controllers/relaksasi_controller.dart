import 'dart:io';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/relaksasi_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

class RelaksasiController extends GetxController {
  var relaksasi = Rxn<Relaksasi>();
  RxBool isLoading = false.obs;


  void setRelaksasi(Relaksasi newRelaksasi){
    relaksasi.value = newRelaksasi;
  }

  Future<void> storeRelaksasi(int userId, String catatan1, String catatan2, String catatan3, String catatan4, String pertanyaan) async{
    try {

      Dio dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        '${Api.baseUrl}/relaksasi',
        data: {
          'user_id': userId,
          'catatan1': catatan1,
          'catatan2': catatan2,
          'catatan3': catatan3,
          'catatan4': catatan4,
          'pertanyaan': pertanyaan
        }
      );

      if(response.statusCode == 200){
        var relaksasiData = response.data['data'];
        Relaksasi relaksasiDataNew = Relaksasi.fromJson(relaksasiData);
        setRelaksasi(relaksasiDataNew);
      } else{
        throw Exception('Failed Store Data');
      }
    } catch (e) {
      print('Error during save data: $e');
      rethrow;
    }
  }
}