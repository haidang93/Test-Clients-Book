import 'package:clientsbook/app/common/widgets/style_scaffold/style_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/clients/controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  @override
  Widget build(BuildContext context) {
    return MenuScaffold(
      title: Text(
        'Clients',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
