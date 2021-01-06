import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';

import '../../../../common/my_function.dart';
import '../../../../modules/login/login/controllers/login_controller.dart';

class SignUpController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  BuildContext context;
  RxBool showPass = false.obs;
  RxString error = ''.obs;
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
  }

  void showPasswordHandle(_) {
    showPass.value = !showPass.value;
  }

  void signupHandle() {}
}
