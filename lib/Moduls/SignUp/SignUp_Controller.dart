import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/Moduls/SignUp/SignUp_Service.dart';

class SignUpController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  int phone_number = 0;

  var SignUpStatus = false;
  var message;
  SignUpService service = SignUpService();

 Future<void> RegisterButton() async {
    User user = User(
        name: name,
        email: email,
        password: password,
        phone_number: phone_number);
    SignUpStatus = await service.register(user);
    message = service.massage;
    if(message is List)
      {
        String temp = '';
        for(String s in message)
          temp += s +'\n';
        message = temp;
      }
  }
}
