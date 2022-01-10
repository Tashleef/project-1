import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/Models/EditProductModel.dart';
import 'package:untitled6/native_service/secure_storage.dart';
import 'LikeService.dart';
import 'ProductDetailsService.dart';

class ProductDetailsController extends GetxController {
  var ProductDetails;
  final product = [].obs;
  ProductDetailsService service = ProductDetailsService();
  final likes = 0.obs;
  final quantity = ''.obs,
      price = ''.obs,
      firstDate = ''.obs,
      secondDate = ''.obs,
      thirdDate = ''.obs,
      firstDiscount = ''.obs,
      secondDiscount = ''.obs,
      thirdDiscount = ''.obs,
      expireDate = ''.obs;
  final message = ''.obs;
  final addItemStatus = false;
  final editItemStatus = false.obs;
  final deleteItemStatus = false.obs;
  final RxString name = ''.obs, description = ''.obs;
  final RxString category = 'Foods'.obs;
  final list = <String>['Foods', 'Drinks', 'Medicine', 'Others'];
  var detailsList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  Future <void> getProductDetails(id)async{

    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    detailsList = await service.productDetails(token!,id);
    print(detailsList);
  }
  LikeService serviceLike = LikeService();
  var LikeStatus = false;
  Future<void> LikeButton(id) async {
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    //String? id = await storage.read('id');
    LikeStatus = await serviceLike.Like(id.toString(), token!);
  }

  final selectedImagePath = ''.obs;
  void setSelected(String? value) => category.value = value!;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  Future<void> editItemButton(id) async {
    EditProduct product = EditProduct(
      name: name.value,
      quantity: quantity.value,
      category: category.value,
      price: price.value,
      img: selectedImagePath.value,
    );
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    print(token);
    print(product);
    editItemStatus.value = await service.editItem(token!, product, id);
    (editItemStatus.value)?message.value = 'Done editing':message.value = 'Something wrong';
  }

  Future<void> deleteItemButton(id) async {
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    deleteItemStatus.value = await service.deleteItem(token!, id);
    (editItemStatus.value)?message.value = 'Product Deleted':message.value = 'Something wrong';
  }

}
