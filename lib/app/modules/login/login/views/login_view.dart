import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';

import '../../../../common/const.dart';
import '../../../../common/my_function.dart';
import '../../../../modules/login/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        looseFocus(context);
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            Container(
              height: Get.mediaQuery.size.height,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 80),
                    //   child: Image.asset(startupLogo),
                    // ),
                    loginPanel(),
                    SizedBox(height: 20),
                    signinButton(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: horizontalineText('Social login'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: signupButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginPanel() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(4, 5)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' LOGIN',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          errorText(),
          SizedBox(height: 10),
          usernameField(),
          SizedBox(height: 30),
          passwordField(),
          SizedBox(height: 20),
          forgotPassword(),
        ],
      ),
    );
  }

  Widget errorText() {
    return Obx(() => Text(
          controller.error.value,
          softWrap: true,
          style: TextStyle(
            color: Colors.red,
          ),
        ));
  }

  Widget usernameField() {
    return Container(
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
      child: Row(
        children: [
          Expanded(
            child: Focus(
              onFocusChange: controller.usernameFocusChange,
              child: TextField(
                controller: controller.username,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.grey,
                onSubmitted: (_) {
                  controller.passFocus.requestFocus();
                },
                textCapitalization: TextCapitalization.none,
                onChanged: controller.usernameChange,
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.showClearUsername.value,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[800],
                ),
                onPressed: controller.clearUsernameHandle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Container(
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
      child: Row(
        children: [
          Expanded(
            child: Obx(() => TextField(
                  controller: controller.password,
                  focusNode: controller.passFocus,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.done,
                  obscureText: !controller.showPass.value,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                )),
          ),
          Obx(
            () => IconButton(
              icon: Icon(
                controller.showPass.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey[800],
              ),
              onPressed: controller.showPasswordHandle,
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTapDown: (_) {
          controller.forgotPassPressed(true);
        },
        onTapUp: (_) {
          controller.forgotPassPressed(false);
        },
        onTap: controller.forgotPassHandle,
        child: Obx(() => Text(
              'Forgot password',
              style: TextStyle(color: controller.forgotPassColor.value),
            )),
      ),
    );
  }

  Widget signinButton() {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            height: 50,
            child: RaisedButton(
              onPressed: controller.signinHandle,
              child: Text('SIGNIN'),
              color: Colors.blue[600],
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget signupButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        onPressed: controller.signupHandle,
        child: Text('SIGNUP'),
        color: Colors.grey[200],
        colorBrightness: Brightness.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  Widget horizontalineText(String text) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 18,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
