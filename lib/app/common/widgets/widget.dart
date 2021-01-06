import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../generated/locales.g.dart';
import '../../routes/app_pages.dart';

import '../const.dart';
import 'slide_menu_page.dart';

Widget styleTextField(String label, TextEditingController controller,
    {TextInputType keyboardType, Function onChange, String hint}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != '') Text(label),
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
            keyboardType: keyboardType,
            onChanged: onChange,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
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

getDialog({
  @required String title,
  @required String content,
  @required List<String> buttons,
  @required Function function1,
  @required Function function2,
}) {
  return Get.dialog(
    AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(onPressed: function1, child: Text(buttons[0])),
        FlatButton(onPressed: function2, child: Text(buttons[1])),
      ],
    ),
    barrierDismissible: false,
  );
}
