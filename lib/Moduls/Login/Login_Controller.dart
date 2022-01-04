import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/Moduls/Login/Login_Service.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class LoginController extends GetxController {
  late String email;
  var password;
  var LoginStatus;
  var message;
  var checkBoxStatus;
  late LoginService service ;




  @override
  void onInit() {
    // TODO: implement onInit
    email= '';
    password= '';
    LoginStatus= false;
    message ='';
    checkBoxStatus=false.obs;
    service=LoginService();
    super.onInit();
  }
  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);

  }

  Future<void> LoginButton() async {
    User user = User(
      email: email,
      password: password,
    );
    LoginStatus = await service.login(user , checkBoxStatus.value);
    message = service.massage;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }
}
