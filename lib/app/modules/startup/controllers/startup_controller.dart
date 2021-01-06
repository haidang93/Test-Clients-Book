import 'package:clientsbook/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StartupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () => Get.offNamed(Routes.LOGIN));
  }
}
