
import 'package:get/get.dart';
import 'package:untitled6/Moduls/SignUp/SignUp_Controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
