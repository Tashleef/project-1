import 'package:get/get.dart';
import 'package:untitled6/Moduls/Login/Login_Controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
