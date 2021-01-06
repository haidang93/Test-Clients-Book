import 'package:get/get.dart';

import 'package:clientsbook/app/modules/clients/controllers/clients_controller.dart';

class ClientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientsController>(
      () => ClientsController(),
    );
  }
}
