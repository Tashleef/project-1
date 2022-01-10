import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/Models/AllProductsModel.dart';
import 'package:untitled6/native_service/secure_storage.dart';
import 'AddItem_Service.dart';

class AddItemController extends GetxController {
  final  quantity = ''.obs,price = ''.obs,firstDate = ''.obs,secondDate = ''.obs,thirdDate = ''.obs,firstDiscount = ''.obs,secondDiscount = ''.obs,thirdDiscount = ''.obs,expireDate = ''.obs;
  late var addItemStatus = false;
  final RxString   name = ''.obs,description = ''.obs;
  final RxString category = 'Foods'.obs;
  final list = <String> ['Foods', 'Drinks', 'Medicine', 'Others'];
  var message;
  final selectedImagePath = ''.obs;
  void setSelected(String? value)=>category.value = value!;
  AddItemService service = AddItemService();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile!=null){
      selectedImagePath.value = pickedFile.path;
    }
  }
  Future<void> addItemButton() async {
    AddProduct product = AddProduct(
      name: name.value,
      description : description.value,
      quantity: quantity.value,
      category:category.value,
      price:price.value,
      first_date:firstDate.value,
      second_date:secondDate.value,
      third_date:thirdDate.value,
      first_discount: firstDiscount.value,
      second_discount: secondDiscount.value,
      third_discount: thirdDiscount.value,
      expire_date: expireDate.value,
      img: selectedImagePath.value,
    );
    print('aah shit here we go again');
    SecureStorage storage = SecureStorage();
    String? token;
     token = await storage.read('token');
    addItemStatus = await service.addItem(token!, product , selectedImagePath.value);
    if(addItemStatus) {
      message = 'Done';
    }
    else {
      message = 'Not Done';
    }

  }
}