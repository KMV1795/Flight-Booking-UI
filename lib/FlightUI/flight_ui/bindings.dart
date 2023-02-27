import 'package:get/get.dart';
import 'controller.dart';

class SplashScreenBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController());
  }

}
