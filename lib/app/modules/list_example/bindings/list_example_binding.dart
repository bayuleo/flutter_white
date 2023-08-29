import 'package:get/get.dart';

import '../controllers/list_example_controller.dart';

class ListExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListExampleController>(
      () => ListExampleController(),
    );
  }
}
