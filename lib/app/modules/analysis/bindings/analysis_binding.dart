import 'package:get/get.dart';

import 'package:clientsbook/app/modules/analysis/controllers/analysis_controller.dart';

class AnalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalysisController>(
      () => AnalysisController(),
    );
  }
}
