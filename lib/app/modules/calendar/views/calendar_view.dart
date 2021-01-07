import 'package:clientsbook/app/common/widgets/style_scaffold/style_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/calendar/controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return MenuScaffold(
      title: Text(
        'Calendar',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
