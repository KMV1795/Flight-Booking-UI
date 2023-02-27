import '../flight_ui/controller.dart';
import 'package:get/get.dart';

class Global {
  static initialize() {
    Get.put(SplashController());
    // Get.put(DashboardController());
    // Get.put(FlightController());

  }

  static SplashController get splash => Get.find();
  // static DashboardController get dashboard => Get.find();
  // static FlightController get flight => Get.find();
}