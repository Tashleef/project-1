import 'package:get/get.dart';
import 'package:untitled6/Moduls/Product_Details/Product_DetailsController.dart';

class EditItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
