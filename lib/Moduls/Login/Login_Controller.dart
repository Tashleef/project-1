import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/Moduls/Login/Login_Service.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class LoginController extends GetxController {
  late RxString email;
  late RxString password;
  late var  loginStatus;
  var message;
  var checkBoxStatus;
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  late LoginService service ;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email= ''.obs;
    password= ''.obs;
    message ='';
    checkBoxStatus=false;
    service=LoginService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);

  }


  Future <bool> LoginButton() async {
    User user = User(
      email: email.value,
      password: password.value,
    );
    loginStatus = await service.login(user);
    message = loginStatus[1];
    if(loginStatus[0] == 200){
      return true;
    }else{
      return false;
    }

  }
}
