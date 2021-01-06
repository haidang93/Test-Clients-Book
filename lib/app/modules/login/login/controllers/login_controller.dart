import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../app/data/database/shared_preferences.dart';
import '../../../../../generated/locales.g.dart';

import '../../../../common/my_function.dart';
import '../../../../common/network.dart';
import '../../../../models/app_model.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode passFocus = FocusNode();
  RxBool showClearUsername = false.obs;
  RxBool showPass = false.obs;
  Rx<Color> forgotPassColor = Colors.grey[700].obs;
  RxString error = ''.obs;
  var locale = Locale('en', 'US').obs;
  @override
  void onInit() {
    super.onInit();
    getLocale();
  }

  @override
  void onClose() {}

  void usernameFocusChange(status) {
    if (status)
      usernameClearVisibility();
    else
      showClearUsername.value = false;
  }

  void usernameChange(String text) {
    usernameClearVisibility();
  }

  void usernameClearVisibility() {
    if (username.text != '') {
      showClearUsername.value = true;
    } else {
      showClearUsername.value = false;
    }
  }

  void clearUsernameHandle() {
    username.clear();
    showClearUsername.value = false;
  }

  void showPasswordHandle() {
    showPass.value = !showPass.value;
  }

  void forgotPassPressed(bool pressed) {
    pressed
        ? forgotPassColor.value = Colors.blue
        : forgotPassColor.value = Colors.grey[700];
  }

  void forgotPassHandle() async {
    if (await hasInternet())
      Get.toNamed(Routes.FORGOT_PASSWORD);
    else
      showInternetError();
  }

  Future<void> signinHandle() async {
    Get.offNamed(Routes.HOME);
  }

  void signupHandle() async {
    if (await hasInternet())
      Get.toNamed(Routes.SIGN_UP);
    else
      showInternetError();
  }

  changeLanguage(change) async {
    locale.value = change;
    await Prefs.single.saveLocale(locale.value);
    Get.updateLocale(locale.value);
  }

  getLocale() {
    if (Prefs.single.locale != null) {
      locale.value = Prefs.single.locale;
    } else {
      locale.value = Get.locale;
    }
  }

  showInternetError() {}
}
