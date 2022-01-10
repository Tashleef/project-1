import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/user.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class SignUpService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.register);
  var message;
  var token;
  Future<dynamic> register(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'aplication/json',
    }, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'phone_number': user.phone_number,
    }).timeout(const Duration(seconds: 60),onTimeout: (){
      return http.Response('timeout' , 505);
    });
    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      token = jsonResponse['token'];
      SecureStorage storage =  SecureStorage();
      await storage.save('token', token);
      return [response.statusCode, message];
    }else if(response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return [response.statusCode , message];
    }else {
      return [response.statusCode,'something went wrong'];
    }
  }
}
