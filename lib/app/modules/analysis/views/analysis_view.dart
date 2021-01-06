import 'package:clientsbook/app/common/widgets/slide_menu_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:clientsbook/app/modules/analysis/controllers/analysis_controller.dart';

class AnalysisView extends GetView<AnalysisController> {
  @override
  Widget build(BuildContext context) {
    return MainPagaLayout(
      title: Text(
        'Analysis',
        style: TextStyle(fontSize: 20),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
