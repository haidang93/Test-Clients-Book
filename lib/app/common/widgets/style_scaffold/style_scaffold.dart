library menu_scaffold;

import 'dart:developer';

import 'package:clientsbook/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const.dart';

part 'slide_menu_page.dart';
part 'menu_item_widget.dart';
part 'menu_item_list.dart';

class MenuScaffold extends StatefulWidget {
  MenuScaffold({
    Key key,
    this.body,
    this.title,
  }) : super(key: key);
  final Widget body;
  final Widget title;
  @override
  _MenuScaffoldState createState() => _MenuScaffoldState();
}

class _MenuScaffoldState extends State<MenuScaffold> {
  @override
  Widget build(BuildContext context) {
    return _SlideMenuPage(
      title: widget.title,
      centerTitle: true,
      color: Colors.indigo[800],
      header: FlatButton(
        onPressed: () {
          Get.offNamed(Routes.SETTING);
        },
        child: Row(
          children: [
            Icon(
              Icons.settings,
              size: 28,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Setting',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      footer: FlatButton(
          onPressed: () {
            Get.offNamedUntil(Routes.LOGIN, (route) => false);
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 28,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          )),
      items: menuItems,
      body: widget.body,
    );
  }
}
