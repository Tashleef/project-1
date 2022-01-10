import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Models/AllProductsModel.dart';


class AddItemService {
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.addItem);
  Future<bool> addItem(String token , AddProduct product, path) async {
    var requst = http.MultipartRequest('POST',url);
    requst.headers.addAll(
        {
          'Accept': 'aplication/json',
          'Authorization': '$token',
        }
    );
    requst.fields.addAll(
      {
        'name': product.name,
        'description': product.description,
        'quantity': product.quantity,
        'category': product.category,
        'price': product.price,
        'first_date': product.first_date,
        'second_date': product.second_date,
        'third_date': product.third_date,
        'first_discount': product.first_discount,
        'second_discount': product.second_discount,
        'third_discount': product.third_discount,
        'expire_date': product.expire_date,


      },
    );
    if(product.img!=null)
    {
      var image = await http.MultipartFile.fromPath('image', path);
      requst.files.add(image);
    }

    var response = await requst.send();

    response.stream.transform(utf8.decoder).listen((value) {

    });

    if (response.statusCode == 200) {
      return true;

    }else {
      return false;
    }
  }
}