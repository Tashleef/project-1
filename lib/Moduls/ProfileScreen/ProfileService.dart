import 'dart:convert';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/Models/UserProfileModel.dart';
import 'package:untitled6/Moduls/ProfileScreen/profile_Screen.dart';

class ProfileService {
  var message;
  var user;
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.userProfile);

  dynamic getProfile(String token) async{
    var response = await http.get(url , headers: {'Accept': 'aplication/json', 'Authorization':  '$token'});
    if(response.statusCode==200)
    {
      var products = profileProductsFromJson(response.body);
      return [products.profileProducts , products.userName];
    }
    else
      return [];
  }
}