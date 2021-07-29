import 'package:get/get.dart';
import 'package:venonweb/controllers/MenuController.dart';
import 'package:venonweb/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:venonweb/screens/general-components/general-components.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuController c = Get.put(MenuController());

    return Scaffold(
        key: c.scaffoldKey,
        drawer: SideMenu(),
        body: kernel("DashBoard", context, DashboardScreen()));
  }
}
