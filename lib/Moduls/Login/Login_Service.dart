import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Config/user_information.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class LoginService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.login);
  var message;
  var token;
  var id;
  Future<dynamic> login(User user) async {
    print(url);
      var response = await http.post(url, headers: {
        'Accept': 'aplication/json',
      }, body: {
        'email': user.email,
        'password': user.password,
      }).timeout( Duration(seconds: 10), onTimeout: (){

        return  http.Response('Error', 400);
      }, );
      print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      token = jsonResponse['token'];
      id = jsonResponse['id'];
      SecureStorage storage =  SecureStorage();
      await storage.save('token', token);
      await storage.save('id', id.toString());
      return [response.statusCode, message];
    }else if(response.statusCode == 401){
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return [response.statusCode , message];
    }else {
      return [response.statusCode,'something went wrong'];
    }
  }
}
