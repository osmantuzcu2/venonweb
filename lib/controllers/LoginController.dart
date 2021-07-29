import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venonweb/models/LoginModel.dart';
import 'package:venonweb/screens/general-components/general-components.dart';
import 'package:venonweb/screens/main/main_screen.dart';
import 'package:venonweb/services/LoginServices.dart';

class LoginController extends GetxController {
  UserLogin? login;
  bool isLoading = false;
  bool error = false;
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  sendLogin() async {
    try {
      isLoading = true;
      update();
      if (userNameCont.text == "" || passwordCont.text == "") {
        print("kullanıcı adı şifre boş");
      } else {
        var data =
            await LoginService.sendLogin(userNameCont.text, passwordCont.text);
        if (data != null) {
          if (data.success == true) {
            Get.off(MainScreen());
          } else {
            Get.defaultDialog(
              title: "Oturum Hatası",
              content: Text(data.error!.message),
              confirm: formButton("Tamam", Icon(Icons.check), Colors.blue, () {
                Get.back();
              }),
              radius: 5,
            );
          }
        } else {
          error = true;
        }
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}
