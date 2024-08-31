import 'dart:io';

import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/psikoedukasi_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

class PsikoedukasiController extends GetxController{

  var psikoedukasi = Rxn<Psikoedukasi>();
  RxBool isLoading = false.obs;

  void setPsikoedukasi(Psikoedukasi newPsikoedukasi){
    psikoedukasi.value = newPsikoedukasi;
  }

  Future<void> storePsikoedukasi(int userId, String catatan1, String catatan2, String catatan3, String catatan4, String catatan5, String pertanyaan) async{
    try{

      Dio dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        '${Api.baseUrl}/psikoedukasi',
        data: {
          'user_id': userId,
          'catatan1': catatan1,
          'catatan2': catatan2,
          'catatan3': catatan3,
          'catatan4': catatan4,
          'catatan5': catatan5,
          'pertanyaan': pertanyaan
        }
      );

      if(response.statusCode == 200){
        var psikoedukasiData = response.data['data'];
        Psikoedukasi psikoedukasiDataNew = Psikoedukasi.fromJson(psikoedukasiData);
        setPsikoedukasi(psikoedukasiDataNew);
      } else {
        throw Exception('failed store data');
      }
    } catch (e) {
      print('Error during save data: $e');
      rethrow;
    }
  }
}