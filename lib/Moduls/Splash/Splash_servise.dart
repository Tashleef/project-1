import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/user.dart';

class SpalshService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.check_validity);
  var massage;
  Future<bool> ChechValid(String token) async {
    var response = await http.get(
      url,
      headers: {'Accept': 'aplication/json', 'Authorization': 'Bearer $token'},
    );
    if(response.statusCode == 200)
      {
        return true;
      }
    else if(response.statusCode == 401)
      {
        massage = 'login please';
        return false;
      }
    else {
      massage = 'server error';

      return false;
    }
  }
}
