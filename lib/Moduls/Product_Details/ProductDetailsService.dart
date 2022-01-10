import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/EditProductModel.dart';
import 'package:untitled6/Models/ProductModel.dart';

class ProductDetailsService {
  var message;

  Future<dynamic> productDetails(String token,id) async{

    var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.productDetails + '/${id.toString()}');
    var response = await http.get(url , headers: {'Accept': 'aplication/json', 'Authorization':  '$token'},
    );
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var json = jsonDecode(response.body);
      var products = Product.fromJson(json["Product"]);
      print(products);
      return products;
    }
    else
    {
      return [false,'The product not found it might be deleted'];
    }
  }


  Future<bool> editItem(String token, EditProduct product, id) async {
    var url = Uri.parse(ServerConfig.DomainNameServer +
        ServerConfig.editItem +
        '/${id.toString()}');

    var requst = http.MultipartRequest('POST', url);
    requst.headers.addAll({
      'Accept': 'aplication/json',
      'Authorization': '$token',
    });

    requst.fields.addAll(
      {
        'name': product.name,
        'quantity': product.quantity,
        'category': product.category,
        'price': product.price,
      },
    );
    var response = await requst.send();

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    if (response.statusCode == 200) {
      message = 'Done';
      return true;
    } else if (response.statusCode == 422) {
      message = 'Error';
      return false;
    } else if (response.statusCode == 401) {
      message = 'Error';
      return false;
    } else {
      message = 'Error';
      return false;
    }
  }

  Future <bool> deleteItem(String token ,int id)async{

    var uri = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.deleteItem + '/${id.toString()}' );
    var response = await http.delete(uri,
      headers: {'Accept': 'aplication/json', 'Authorization': '$token'},
    );

    print(response.statusCode);


    return true;
  }
}