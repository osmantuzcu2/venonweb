import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'DealersModel.dart';
import 'DelaersService.dart';
import 'package:get/get.dart';

class DealersListController extends GetxController {
  Dealers? dealerList;
  bool isLoading = false;
  bool error = false;
  TextEditingController titleCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController mailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  int? test = 0;
  double? lat;
  double? long;
  @override
  void onInit() {
    fetchDealers();
    super.onInit();
  }

  clearForm() {
    titleCont.text = "";
    addressCont.text = "";
    mailCont.text = "";
    phoneCont.text = "";
  }

  createFrom(Datum dealer) {
    titleCont.text = dealer.title!;
    addressCont.text = dealer.address!;
    mailCont.text = dealer.eMail!;
    phoneCont.text = dealer.phone!;
    update();
  }

  createDealer(String? title, String? email, String? phone, String? address,
      int? cityId, int? CountyId, double? latitude, double? longitude) async {
    try {
      isLoading = true;
      update();
      var dealer = await DealersService.createDealer(
          title, email, phone, address, cityId, CountyId, latitude, longitude);
      if (dealer != null) {
        if (dealer.success == true) {
          fetchDealers();
          Get.back();
          Get.snackbar('Form', 'Bayi Eklendi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', dealer.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Bayi Eklenmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading = false;
      clearForm();
      update();
    }
  }

  updateDealer(
      int? id,
      String? title,
      String? email,
      String? phone,
      String? address,
      int? cityId,
      int? CountyId,
      double? latitude,
      double? longitude) async {
    try {
      isLoading = true;
      update();
      var dealer = await DealersService.updateDealer(id, title, email, phone,
          address, cityId, CountyId, latitude, longitude);
      if (dealer != null) {
        if (dealer.success == true) {
          fetchDealers();
          Get.back();
          Get.snackbar('Form', 'Bayi Güncellendi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', dealer.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Bayi Güncellenmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      clearForm();
      isLoading = false;
      update();
    }
  }

  deleteDealer(
    int? id,
  ) async {
    try {
      isLoading = true;
      update();
      var dealer = await DealersService.deleteDealer(id!);
      if (dealer != null) {
        if (dealer.success == true) {
          fetchDealers();
          Get.back();
          Get.snackbar('Form', 'Bayi Silindi',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Bir Sorun Oluştu', dealer.error!.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        error = true;
        Get.back();
        Get.snackbar('Form', 'Bayi Silinmedi',
            backgroundColor: Colors.red[100],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading = false;
      clearForm();
      update();
    }
  }

  fetchDealers() async {
    try {
      isLoading = true;
      update();
      var dealer = await DealersService.fetchDealers();
      if (dealer != null) {
        dealerList = dealer;
      } else {
        error = true;
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}
