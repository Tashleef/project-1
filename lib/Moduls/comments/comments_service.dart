import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/Comments.dart';
import 'package:untitled6/Models/ProductModel.dart';

class CommentService {
  Future<dynamic> addComment(int id ,String comment, String token) async {
    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.comment +'/${id.toString()}');
    var response = await http.post(url , headers: {
      'Accept': 'aplication/json','Authorization': '$token',
    },body: {'comment': comment}
    );
    print('2');
    print(response.body);
  }

  Future<dynamic> showComments(int id , String token) async {
    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.comment +'/${id.toString()}');
    var response = await http.get(url, headers: {
      'Accept': 'aplication/json','Authorization': '$token',
    },
    );
    print('1');
    print(response.body);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var comments =  json["comments"];
      return comments;
    }
    return [

    ];
  }
}