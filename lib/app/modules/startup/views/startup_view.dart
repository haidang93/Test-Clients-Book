import 'package:clientsbook/app/common/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/startup/controllers/startup_controller.dart';

class StartupView extends GetView<StartupController> {
  final StartupController start = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(startupLogo)),
    );
  }
}
