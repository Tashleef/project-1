import 'package:get/get.dart';
import 'package:untitled6/Moduls/Edit_Item/Edit_ItemController.dart';

class EditItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditItemController>(EditItemController());
  }
}
