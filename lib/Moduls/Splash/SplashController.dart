import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled6/Moduls/Splash/Splash_servise.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class SplashController extends GetxController {
  late SecureStorage storage;
  late bool valid_token;
  late SpalshService service;
  @override
  void onInit() async {
    valid_token = false;
    storage = SecureStorage();
    service= SpalshService();
    await ChechToken();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  Future<void> ChechToken() async {
    String? token = await storage.read('token');
    if (token != null) {
      await ValidToken(token);
          if(valid_token){
Get.offAllNamed('/AllProducts');
          }
    else {
      EasyLoading.showError(service.massage ,dismissOnTap: true );
            Get.offAllNamed('/Login');

          }
    } else {
      Get.offAllNamed('/Login');
    }
  }

  Future<void> ValidToken (String token) async{
  valid_token = await service.ChechValid(token);
  }
}
