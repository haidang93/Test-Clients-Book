import 'dart:developer';

import 'package:clientsbook/app/common/const.dart';
import 'package:clientsbook/app/common/widgets/slide_menu_page.dart';
import 'package:clientsbook/app/common/widgets/widget.dart';
import 'package:clientsbook/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainPagaLayout(
      title: Text(
        'Homescreen',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
