
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/Moduls/SignUp/SignUp_Service.dart';

class SignUpController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  var phone_number = '';

  var signUpStatus = [

  ];
  var message;
  SignUpService service = SignUpService();

 Future<bool> RegisterButton() async {
    User user = User(
        name: name,
        email: email,
        password: password,
        phone_number: phone_number
    );
    signUpStatus = await service.register(user);
    message = signUpStatus[1];
    if(signUpStatus[0] == 201){
      return true;
    }else{
      return false;
    }
  }
}
