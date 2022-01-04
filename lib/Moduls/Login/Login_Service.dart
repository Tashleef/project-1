import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Config/user_information.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class LoginService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.login);
  var massage;
  var token;
  Future<bool> login(User user , bool checkBox) async {
    var response = await http.post(url, headers: {
      'Accept': 'aplication/json',
    }, body: {
      'email': user.email,
      'password': user.password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['msg'];
      token = jsonResponse['token'];
      UserInformation.user_token=token;
      if(checkBox)
        {
          // save token to device
          SecureStorage storage = new SecureStorage();
         await storage.save('token', UserInformation.user_token);
        }
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['errors'];
      return false;
    } else if (response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['errors'];
      return false;
    } else {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['errors'];
      return false;
    }
  }
}
