import 'package:clientsbook/app/common/widgets/style_scaffold/style_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MenuScaffold(
      title: Text(
        'Homescreen',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
