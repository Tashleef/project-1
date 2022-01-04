import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled6/Getx_bindings/Add_Item_Binding.dart';
import 'package:untitled6/Getx_bindings/All_Products_Binding.dart';
import 'package:untitled6/Getx_bindings/Edit_Item_Binding.dart';
import 'package:untitled6/Getx_bindings/Login_Binding.dart';
import 'package:untitled6/Getx_bindings/SignUp_Binding.dart';
import 'package:untitled6/Getx_bindings/Splash_Binding.dart';
import 'package:untitled6/Moduls/Add_Item/Add_Item.dart';
import 'package:untitled6/Moduls/All_Products/All_Products.dart';
import 'package:untitled6/Moduls/Edit_Item/Edit_Item.dart';
import 'package:untitled6/Moduls/Login/Login.dart';
import 'package:untitled6/Moduls/SignUp/SignUp.dart';
import 'package:untitled6/Moduls/Splash/Splach.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/Splash',
      getPages: [
        GetPage(name: '/Login', page: ()=> Login() , binding: LoginBinding()),
        GetPage(name: '/SignUp', page: ()=> signup() , binding: SignUpBinding()),
        GetPage(name: '/AddItem', page: ()=> Additem() , binding: AddItemBinding()),
        GetPage(name: '/AllProducts', page: ()=> MainPage() , binding: ALLProductsBinding()),
        GetPage(name: '/EditItem', page: ()=> edit_item() , binding: EditItemBinding()),
        GetPage(name: '/Splash', page: ()=> Splash() , binding: SplashBinding()),

      ],
      builder: EasyLoading.init(),
    )
  );
}

