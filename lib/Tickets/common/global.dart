import 'package:get/get.dart';
import '../tickets_modules/controller.dart';

class TicketsGlobal {

  static initialize() {
    Get.put(TicketsController());
  }

  static TicketsController get splash => Get.find();

}