import 'package:get/get.dart';
import '../common/routes.dart';

class SplashController extends  GetxController{
  /// Move from Splash to Intro after 5 seconds
  Future<void> delayedMove({int milli = 6000, String? to}) async {
    await Future.delayed(Duration(milliseconds: milli));
    Get.offAllNamed(to ?? Routes.INTRO);
  }


  @override
  void onInit() {
    super.onInit();
    delayedMove();
  }
}

