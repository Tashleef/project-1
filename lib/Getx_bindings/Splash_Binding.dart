import 'package:get/get.dart';
import 'package:untitled6/Moduls/Splash/SplashController.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }

}