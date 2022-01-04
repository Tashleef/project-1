import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/user.dart';

class SignUpService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.register);
  var massage;
  Future<bool> register(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'aplication/json',
    }, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'phone_number': user.phone_number,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['msg'];
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
