import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:venonweb/models/GeneralModels.dart';
import 'package:venonweb/models/UsersModel.dart';
import 'package:venonweb/services/UsersService.dart';
import 'package:get/get.dart';

import '../constants.dart';

class UsersListController extends GetxController {
  Users? userList;
  bool isLoading = false;
  bool error = false;
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController surnameCont = TextEditingController();
  TextEditingController mailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  UserTypeModel? selectedValue = userType[0];
  int? test = 0;
  @override
  void onInit() {
    fetchuser();
    super.onInit();
  }

  clearForm() {
    userNameCont.text = "";
    passwordCont.text = "";
    nameCont.text = "";
    surnameCont.text = "";
    mailCont.text = "";
    phoneCont.text = "";
    selectedValue = userType[0];
  }

  createFrom(Datum user) {
    userNameCont.text = user.userName!;
    nameCont.text = user.name!;
    surnameCont.text = user.lastName!;
    mailCont.text = user.eMail!;
    phoneCont.text = user.phone!;
    update();
  }

  createUser(
    int? userType,
    String? passWord,
    String? name,
    String? lastName,
    String? eMail,
    String? phone,
  ) async {
    try {
      isLoading = true;
      update();
      var user = await UsersService.createUser(
        userType!,
        passWord!,
        name!,
        lastName!,
        eMail!,
        phone!,
      );
      if (user != null) {
        if (user.success == true) {
          fetchuser();
          Get.back();
          Get.snackbar('Form', 'Kullanıcı Eklendi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', user.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Kullanıcı Eklenmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading = false;
      clearForm();
      update();
    }
  }

  updateUser(
    int id,
    String userName,
    int userType,
    String name,
    String lastName,
    String eMail,
    String phone,
  ) async {
    try {
      isLoading = true;
      update();
      var user = await UsersService.updateUser(
        id,
        userName,
        userType,
        name,
        lastName,
        eMail,
        phone,
      );
      if (user != null) {
        if (user.success == true) {
          fetchuser();
          Get.back();
          Get.snackbar('Form', 'Kullanıcı Güncellendi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', user.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Kullanıcı Güncellenmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      clearForm();
      isLoading = false;
      update();
    }
  }

  deleteUser(
    int? id,
  ) async {
    try {
      isLoading = true;
      update();
      var user = await UsersService.deleteUser(id!);
      if (user != null) {
        if (user.success == true) {
          fetchuser();
          Get.back();
          Get.snackbar('Form', 'Kullanıcı Silindi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', user.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Kullanıcı Silinmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading = false;
      clearForm();
      update();
    }
  }

  fetchuser() async {
    try {
      isLoading = true;
      update();
      var user = await UsersService.fetchUsers();
      if (user != null) {
        userList = user;
      } else {
        error = true;
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  select(val) {
    selectedValue = userType[(val! - 1)];
    update();
  }

  testf() {
    test = test! + 1;
    print(test);
    update();
  }
}
