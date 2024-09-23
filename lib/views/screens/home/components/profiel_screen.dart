import 'package:ada_cbt/controllers/document_controller.dart';
import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/views/screens/home/components/card_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.userId});

  final int userId;
  final DocumentController documentController = Get.put(DocumentController());
  final LoginController loginController = Get.put(LoginController());
  String documentLink = '';

  Future<void> _getData() async{
    await documentController.getDocument(userId);
    documentLink = documentController.document.value!.documentLink;

    if(documentLink != ""){
      try{
        await launchUrl(
            Uri.parse(documentLink),
            mode: LaunchMode.externalApplication
        );
      } catch (e){
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      Get.snackbar("Failed", "Dokumen tidak ada");
    }
  }

  Future<void> _logout() async{
    await loginController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardProfile(
            text: "Download Blanko",
            icon: Icons.file_download,
            onClick: () {
                _getData();
            }
        ),
        CardProfile(
            text: "Logout",
            icon: Icons.logout,
            onClick: () {
              _logout();
            }
        ),
      ],
    );
  }
}
