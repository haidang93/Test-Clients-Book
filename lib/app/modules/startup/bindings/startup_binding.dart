import 'package:get/get.dart';

import 'package:clientsbook/app/modules/startup/controllers/startup_controller.dart';

class StartupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartupController>(
      () => StartupController(),
    );
  }
}
