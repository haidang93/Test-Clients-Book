import 'package:clientsbook/app/common/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';

import '../../../../common/const.dart';
import '../../../../common/my_function.dart';
import '../../../../modules/login/forgot_password/controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        looseFocus(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700]),
          title: Text(
            'Reset password',
            style: TextStyle(color: Colors.grey[700]),
          ),
          brightness: Brightness.light,
          elevation: 0,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            inputPhoneNumber(),
            resetPassword(),
          ],
        ),
      ),
    );
  }

  inputPhoneNumber() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            errorText(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: styleTextField(
                'Phone number',
                controller.phoneNumber,
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: controller.getOTP,
                  child: Text(
                    'Get OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: primaryColor,
                  colorBrightness: Brightness.light,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetPassword() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            errorText(),
            styleTextField(
              'OTP',
              controller.otp,
            ),
            styleTextField(
              'Phone number',
              controller.phoneNumber,
              keyboardType: TextInputType.phone,
            ),
            passwordField(
              'New password',
              controller.pass,
            ),
            passwordField(
              'Confirm password',
              controller.confirmPass,
            ),
            showPass(),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: controller.submit,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: primaryColor,
                        colorBrightness: Brightness.light,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Obx(() => RaisedButton(
                            onPressed: controller.resend,
                            child: Text(
                              controller.canResend.value
                                  ? 'Resend'
                                  : 'Resend' + ' (${controller.countDown})',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: controller.canResend.value
                                ? primaryColor
                                : Colors.grey,
                            colorBrightness: Brightness.light,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showPass() {
    return Row(
      children: [
        Obx(() => Checkbox(
            value: controller.showPass.value,
            onChanged: controller.showPasswordHandle)),
        Text('Show password')
      ],
    );
  }

  Widget passwordField(
    String label,
    TextEditingController textController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(color: Colors.grey[200]),
                BoxShadow(
                    color: Colors.grey[50],
                    spreadRadius: -3,
                    blurRadius: 4,
                    offset: Offset(4, 5)),
              ],
            ),
            child: Obx(() => TextField(
                  controller: textController,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.done,
                  obscureText: !controller.showPass.value,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    // hintText: label,
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  errorText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => Text(
            controller.error.value,
            softWrap: true,
            style: TextStyle(
              color: Colors.red,
            ),
          )),
    );
  }
}
