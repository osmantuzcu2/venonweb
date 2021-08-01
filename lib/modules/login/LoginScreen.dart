import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venonweb/modules/login/LoginController.dart';
import 'package:venonweb/screens/general-components/general-components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            child: Form(
              key: c.formKey,
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  genInput("Kullanıcı Adınız", c.userNameCont, false),
                  genInput("Parolanız", c.passwordCont, true),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        formButton(
                            "Parolamı Yenile",
                            Icon(CupertinoIcons.lock_open_fill),
                            Colors.blue,
                            () {}),
                        formButton("Giriş", Icon(Icons.login), Colors.green,
                            () {
                          if (c.formKey.currentState!.validate()) {}
                          print("butona basışldı");
                          c.sendLogin();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
