import 'package:get/get.dart';

import 'controller.dart';

class TicketsBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TicketsController>(() => TicketsController());
  }

}