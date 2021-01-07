import 'package:clientsbook/app/common/widgets/style_scaffold/style_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/setting/controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return MenuScaffold(
      title: Text(
        'Setting',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
