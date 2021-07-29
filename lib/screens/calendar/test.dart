import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venonweb/controllers/test.dart';
import 'package:venonweb/screens/general-components/general-components.dart';
import 'package:venonweb/screens/main/components/side_menu.dart';

class TestScreen extends StatelessWidget {
  final TestController c = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: kernel(
          "Test",
          context,
          SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: GetBuilder<TestController>(
                      init: TestController(),
                      builder: (_) {
                        if (c.isLoading == true) {
                          return Center(
                              child: Container(
                                  padding: EdgeInsets.all(300),
                                  child: CircularProgressIndicator()));
                        } else if (c.error == true) {
                          return Center(
                              child: Container(
                                  padding: EdgeInsets.all(300),
                                  child: Text("Error")));
                        } else {
                          return Text(c.testList!.data.name!);
                        }
                      } /* GridView.count(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: (3),
                          children:
                              List.generate(c.testList!.data.length, (index) {
                            return Text(c.testList!.data[index].name!);
                          })) */
                      )))),
    );
  }
}
