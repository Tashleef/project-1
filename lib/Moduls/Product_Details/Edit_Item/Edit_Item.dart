import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../constant.dart';
import 'Edit_ItemController.dart';


final controller = Get.put(EditItemController());
class EditItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Edit Item',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              backgroundColor: kThirdColor,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          kPrimaryColor,
                          kThirdColor,
                        ],

                      ),
                    ),
                  ),
                  ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Stack(
                          children: [

                            Obx( ()=>
                                Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    width: ww * 0.5,
                                    height: hh * 0.3,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: (controller.selectedImagePath.value != '')
                                        ? Image(
                                      image: FileImage(
                                        File(controller.selectedImagePath.value),
                                      ),
                                    )
                                        : null),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: ww * 0.4, top: hh * 0.2),
                              child: GestureDetector(
                                onTap: () => controller.getImage(ImageSource.gallery),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: ww * 0.15, right: ww * 0.15),
                        padding:
                            EdgeInsets.only(left: ww * 0.07, right: ww * 0.07),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Container(
                              width: ww * 0.5,
                              child: TextFormField(
                                onChanged: (value) {
                                  print(controller.name.value);
                                  controller.name.value = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ww * 0.15,
                          right: ww * 0.15,
                        ),
                        padding: EdgeInsets.only(
                          left: ww * 0.07,
                          right: ww * 0.07,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Container(
                              width: ww * 0.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  controller.quantity.value = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'quantity',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ww * 0.15,
                          right: ww * 0.15,
                        ),
                        padding: EdgeInsets.only(
                          left: ww * 0.07,
                          right: ww * 0.07,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            SizedBox(
                              width: ww * 0.5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  controller.price.value = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'price',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: ww * 0.4,
                          child: Obx(()=> DropdownButton <String>(
                            value: controller.category.value,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: kSecondryColor,
                            ),
                            onChanged: (String? newValue) => controller.setSelected(newValue!),

                            items: controller.list.map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem<String>(
                                value: value!,
                                child: Text(value,
                                style: TextStyle(
                                  color: Colors.black
                                ),),
                              );
                            }).toList(),
                          ),
                          ),

                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                             onClickEditItem(Get.arguments);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: ww * 0.10,
                                right: ww * 0.10,
                                top: hh * 0.02,
                                bottom: hh * 0.02),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: kSecondryColor,
                            ),
                            child: Text(
                              'Save',
                              style: GoogleFonts.montserrat(
                                //fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: ww * 0.08,
                                right: ww * 0.08,
                                top: hh * 0.02,
                                bottom: hh * 0.02),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.montserrat(
                                //fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
  void onClickEditItem(id) async {
    print(id);
    EasyLoading.show(status: 'loading..');
    await controller.editItemButton(id);
    if (controller.EditItemStatus) {
      EasyLoading.showSuccess(controller.message, dismissOnTap: true);
      Get.offAllNamed('/AllProducts');
    } else {
      EasyLoading.showError(controller.message, dismissOnTap: true);
    }
  }
}

