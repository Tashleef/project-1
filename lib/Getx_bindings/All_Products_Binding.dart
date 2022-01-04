import 'package:get/get.dart';
import 'package:untitled6/Moduls/All_Products/All_ProdcutsController.dart';


class ALLProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<All_Products_Controller>(All_Products_Controller());
  }
}
