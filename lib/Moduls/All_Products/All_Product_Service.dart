import 'dart:convert';

import 'package:untitled6/Config/ConfigServer.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/Models/ProductModel.dart';

class AllProductsService {
  var message;

  Future<List<dynamic>> getAllProducts(String token) async {
    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.allProduct);
    var response = await http.get(url,
        headers: {'Accept': 'aplication/json', 'Authorization': '$token'},
        );
    if (response.statusCode == 200) {
      var products = allProductFromJson(response.body);
    return [products.products,products.userName];
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getCategory(String token , String category) async {
    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.category);
    var response = await http.post(url,
      headers: {'Accept': 'aplication/json', 'Authorization': '$token'},
      body: {
      'search': category
      }
    ).timeout(Duration(seconds: 10),onTimeout: ()async{
     return http.Response('timeout' , 505);
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var products = List<Product>.from(json["Search"].map((x) => Product.fromJson(x)));
      return products;
    } else {
      return [];
    }
  }

  Future <List<dynamic>> getSort(String token,String sort) async {
    var url2 = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.sort);
    var response = await http.post(url2,
        headers: {'Accept': 'aplication/json','Authorization': '$token'},
        body: {'sortType': sort});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var products = List<Product>.from(json['Sorted By'].map((x) => Product.fromJson(x)));
      return products;
    } else {
      return [
      ];
    }
  }

  dynamic getSearch(String token, String name) async {
    var url1 = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.search);
    var response = await http.post(url1,
        headers: {'Authorization': '$token'},
        body: { 'search': name});
    //print(response.body);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var products = List<Product>.from(json["Search"].map((x) => Product.fromJson(x)));
      return products;
    } else
      return [];
  }
}
