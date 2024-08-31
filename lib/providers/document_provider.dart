import 'package:ada_cbt/helpers/api.dart';
import 'package:ada_cbt/models/document_model.dart';
import 'package:dio/dio.dart';

class DocumentProvider {

  Future<Document> getDocument(int userId) async {
    final response = await Dio().post(
      '${Api.baseUrl}/document',
      data: {
        'id': userId
      }
    );
    if(response.statusCode == 200) {
      return Document.fromJson(response.data['data']);
    } else {
      throw Exception('invalid parse data');
    }
  }
}