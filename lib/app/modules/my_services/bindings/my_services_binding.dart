import 'package:get/get.dart';

import 'package:clientsbook/app/modules/my_services/controllers/my_services_controller.dart';

class MyServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyServicesController>(
      () => MyServicesController(),
    );
  }
}
