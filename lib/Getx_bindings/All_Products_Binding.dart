import 'package:get/get.dart';
import 'package:untitled6/Moduls/All_Products/All_ProdcutsController.dart';
import 'package:untitled6/Moduls/ProfileScreen/profileController.dart';


class ALLProductsBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(All_Products_Controller());

    Get.lazyPut(() => ProfileController());
  }
}
