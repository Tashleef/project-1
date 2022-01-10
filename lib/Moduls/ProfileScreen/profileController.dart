import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/Config/user_information.dart';
import 'package:untitled6/Models/UserProfileModel.dart';
import 'package:untitled6/native_service/secure_storage.dart';

import 'ProfileService.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  List <dynamic> responseList = [];
  final name = ''.obs;
  RxList ProfileProductsList = [].obs;
  ProfileService service = ProfileService();
  @override
  void onInit() async{
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    responseList = await service.getProfile(token!);
    name.value = responseList[1];
    ProfileProductsList.value = responseList[0];
    isLoading(false);
    super.onInit();
  }
}