import 'package:get/get.dart';
import 'package:untitled6/Moduls/Add_Item/Add_ItemController.dart';


class AddItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Add_ItemController>(Add_ItemController());
  }
}
