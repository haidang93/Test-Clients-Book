import 'package:clientsbook/app/common/widgets/style_scaffold/style_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/my_services/controllers/my_services_controller.dart';

class MyServicesView extends GetView<MyServicesController> {
  @override
  Widget build(BuildContext context) {
    return MenuScaffold(
      title: Text(
        'My Services',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
