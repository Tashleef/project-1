import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:untitled6/Config/ConfigServer.dart';

class LikeService {

  Future<bool> Like(String id , String token) async {

    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.like + '/${id.toString()}');
    print(url);
    var response = await http.get(url , headers: {
      'Accept': 'aplication/json','Authorization': '$token',
    },
    );
    print(response.body);
    print(response.statusCode);
    return true;
  }
}