import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';
import '../../../../common/const.dart';
import '../../../../common/my_function.dart';
import '../../../../modules/login/sign_up/controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
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
            'Sign up',
            style: TextStyle(color: Colors.grey[700]),
          ),
          brightness: Brightness.light,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            errorText(),
            textField('Full name', controller.name),
            textField('Phone number', controller.phoneNumber),
            passwordField('Password', controller.password),
            passwordField('Confirm password', controller.confirmPassword),
            showPass(),
            signupButton(),
          ],
        ),
      ),
    );
  }

  Widget textField(
    String label,
    TextEditingController controller,
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
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.grey,
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                // hintText: label,
                contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
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

  Widget showPass() {
    return Row(
      children: [
        Obx(() => Checkbox(
            value: controller.showPass.value,
            onChanged: controller.showPasswordHandle)),
        Text('Show password'),
      ],
    );
  }

  Widget signupButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 50,
        width: double.infinity,
        child: RaisedButton(
          onPressed: controller.signupHandle,
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
          color: primaryColor,
          colorBrightness: Brightness.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }

  Widget errorText() {
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
