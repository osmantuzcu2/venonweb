import 'package:get/state_manager.dart';
import 'package:venonweb/models/test.dart';
import 'package:venonweb/services/TestService.dart';

class TestController extends GetxController {
  Test? testList;
  bool isLoading = false;
  bool error = false;
  @override
  void onInit() {
    fetchTest();
    super.onInit();
  }

  fetchTest() async {
    try {
      isLoading = true;
      update();
      var test = await TestService.fetchTest();
      if (test != null) {
        testList = test;
      } else {
        error = true;
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}
