import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/Config/user_information.dart';
import 'package:untitled6/Models/ProductModel.dart';
import 'package:untitled6/native_service/secure_storage.dart';

import 'All_Product_Service.dart';

class All_Products_Controller extends GetxController {
  final selectedIndex = 0.obs;
  var isLoading = true.obs;
  final name = ''.obs;
  List<dynamic> allProductsList = [];
  List <dynamic> AllProductsList = [];
  List  <dynamic> temp = [];
  final search = ''.obs;
  var searchProductsList;
  AllProductsService service = AllProductsService();

  Future <void> searchButton() async {
    isLoading.value = true;
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    allProductsList = await service.getSearch(token!, search.value);
    isLoading.value = false;
  }

  Future <void> categoryButton(String category) async {
    isLoading.value = true;
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    allProductsList = await service.getCategory(token!, category);
    isLoading.value = false;
  }

  Future <void> normalMode() async {
    isLoading.value = true;
    allProductsList = temp;
    isLoading.value = false;
  }

  @override
  void onInit() async{
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    AllProductsList = await service.getAllProducts(token!);
    allProductsList = AllProductsList[0];
    name.value = AllProductsList[1];
    temp = allProductsList;
    isLoading(false);
    super.onInit();
  }


  Future <void> sortButton( String searchType) async {
    isLoading.value = true;
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    allProductsList = await service.getSort(token!, searchType);
    isLoading.value = false;
  }


}