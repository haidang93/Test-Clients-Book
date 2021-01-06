import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';
import '../../../../common/network.dart';
import '../../../../common/my_function.dart';
import '../../../../modules/login/login/controllers/login_controller.dart';

class ForgotPasswordController extends GetxController {
  PageController pageController = PageController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  RxString error = ''.obs;
  RxBool showPass = false.obs;
  RxBool canResend = false.obs;
  RxInt countDown = 21.obs;

  @override
  void onInit() {
    super.onInit();
    resendCountDown();
  }

  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
  }

  resendCountDown() async {
    canResend.value = false;
    for (int i = 0; i < 21; i++) {
      await Future.delayed(Duration(seconds: 1));
      countDown.value--;
      if (countDown.value == 0) canResend.value = true;
    }
  }

  getOTP() async {}

  submit() {}

  resend() {
    if (canResend.value) {
      countDown.value = 21;
      resendCountDown();
      getOTP();
    }
  }

  void showPasswordHandle(_) {
    showPass.value = !showPass.value;
  }
}
