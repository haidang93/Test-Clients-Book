import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../generated/locales.g.dart';

import 'const.dart';

looseFocus(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}

showToastMessage(String message,
    {ToastGravity position = ToastGravity.SNACKBAR}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 3,
    backgroundColor: primaryColor,
    textColor: Colors.white,
    fontSize: 15,
  );
}

String timeFormat(DateTime time, int format) {
  var hour = format == 12 && time.hour > 12 ? time.hour - 12 : time.hour;
  var minute = time.minute;
  String ampm = time.hour >= 12 ? 'PM' : 'AM';
  String h = hour > 10 ? '$hour' : '0$hour';
  String m = minute > 10 ? '$minute' : '0$minute';
  return '$h : $m ${format == 12 ? ampm : ''}';
}

String dateFormat(DateTime dateTime, bool withTime) {
  String year = dateTime.year.toString();
  String month = dateTime.month < 10
      ? '0' + dateTime.month.toString()
      : dateTime.month.toString();
  String day = dateTime.day < 10
      ? '0' + dateTime.day.toString()
      : dateTime.day.toString();
  String hour = dateTime.hour < 10
      ? '0' + dateTime.hour.toString()
      : dateTime.hour.toString();
  String minute = dateTime.minute < 10
      ? '0' + dateTime.minute.toString()
      : dateTime.minute.toString();
  String second = dateTime.second < 10
      ? '0' + dateTime.second.toString()
      : dateTime.second.toString();
  return withTime
      ? '$day-$month-$year, $hour:$minute:$second'
      : '$day-$month-$year';
}

List<List> partition(List list, int number) {
  List<List> res = [];
  int count = 0;
  list.forEach((element) {
    count == 0 ? res.add([element]) : res.last.add(element);
    count++;
    if (count == number) count = 0;
  });
  return res;
}

String byteConverter(int byte) {
  if (byte < 1024) return '$byte byte';
  byte = byte ~/ 1024;
  if (byte < 1024) return '$byte kb';
  byte = byte ~/ 1024;
  if (byte < 1024) return '$byte mb';
  byte = byte ~/ 1024;
  if (byte < 1024) return '$byte gb';
  return '';
}

Future loadingDialog(String text, Function function) async {
  if (text == '') text = 'Loading...';
  Get.dialog(
    Dialog(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(text),
            ],
          )),
    ),
    barrierDismissible: false,
  );
  await function();
  Get.back();
}

String thousandSeperater(int input) {
  bool negative = input < 0;
  if (negative) input *= -1;
  String t = input.toString();
  int a = t.length;
  List<String> f = t.split('');
  if (t.length % 3 == 0) {
    for (int i = 1; i < t.length ~/ 3; i++) {
      a = a - 3;
      f.insert(a, ',');
    }
  } else {
    for (int j = 0; j < t.length ~/ 3; j++) {
      a = a - 3;
      f.insert(a, ',');
    }
  }
  if (negative) f.insert(0, '-');
  return f.join();
}
