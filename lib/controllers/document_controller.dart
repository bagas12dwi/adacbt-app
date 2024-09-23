import 'package:ada_cbt/models/document_model.dart';
import 'package:ada_cbt/providers/document_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController{
  var document = Rxn<Document>();

  Future<void> getDocument(int userId) async{
    try{
      var documentData = await DocumentProvider().getDocument(userId);
      document.value = documentData;
    } catch (e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}