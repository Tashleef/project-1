import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/Moduls/Add_Item/Add_ItemController.dart';
import 'dart:io';
import 'package:untitled6/component/search_bar.dart';
import 'package:untitled6/constant.dart';

class AddItem extends StatelessWidget {
  final AddItemController controller = Get.find();
  XFile? image;
  

  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  DateTime date3 = DateTime.now();
  DateTime current = DateTime.now();
  Future<void> selectDate(BuildContext context, int i) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: current,
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != current) {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Item',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [kPrimaryColor, kSecondryColor],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                   Obx( ()=>
                    Container(
                        margin: const EdgeInsets.only(left: 30),
                        width: width * 0.5,
                        height: height * 0.3,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: (controller.selectedImagePath.value != '')
                            ? Image(
                          fit: BoxFit.cover,
                                image: FileImage(
                                  File(controller.selectedImagePath.value),
                                ),
                              )
                            : null),
                   ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.4, top: height * 0.2),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: Obx(()=> DropdownButton <String>(
                          value: controller.category.value,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: kSecondryColor,
                            ),
                            onChanged: (String? newValue) => controller.setSelected(newValue!),

                            items:
                                controller.list.map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem<String>(
                                value: value!,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                      ),

                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'Name',
                        hidden: false,
                        function: (value) {
                          controller.name.value = value;
                          print(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: width * 0.4,
                        child: CustomTextField(
                          hintText: 'Price',
                          hidden: false,
                          function: (value) {
                            controller.price.value = value;
                            print(int.parse(value));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: width * 0.4,
                        child: CustomTextField(
                          hintText: 'Quantity',
                          hidden: false,
                          function: (value) {
                            controller.quantity.value = value;
                            print(value);
                          },
                        ),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.7,
                  child: CustomTextField(
                    hintText: 'expire-date',
                    hidden: false,
                    function: (value) {
                      controller.expireDate.value = value;
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'First Date',
                        hidden: false,
                        function: (value){
                          controller.firstDate.value = value;
                          print(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'First Discount',
                        hidden: false,
                        function: (value){
                          controller.firstDiscount.value = value;
                          print(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'Second Date',
                        hidden: false,
                        function: (value) {
                        controller.secondDate.value = value;
                        print(value);
                      },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'Second Discount',
                        hidden: false,
                        function: (value) {
                          controller.secondDiscount.value = value;
                          print(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'Third Date',
                        hidden: false,
                        function: (value) {
                          controller.thirdDate.value = value;
                          print(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * 0.4,
                      child: CustomTextField(
                        hintText: 'Third Discount',
                        function: (value) {
                          controller.thirdDiscount.value = value;
                          print(value);
                        },
                        hidden: false,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    hintText: 'Add Description',
                    function: (value) {
                      controller.description.value = value;
                      print(value);
                    },
                    hidden: false,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: ()  {
                  onClickAddItem();
                },
                child: Container(
                  height: height * 0.1,
                  decoration: const BoxDecoration(
                      color: kThirdColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: const Center(
                    child: Text(
                      'Add New Product',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          )
        ],
      ),
    );
  }
  void onClickAddItem() async {
    EasyLoading.show(status: 'loading..');
    await controller.addItemButton();
    if (controller.addItemStatus) {
      EasyLoading.showSuccess(controller.message, dismissOnTap: true);
      Get.offAllNamed('/AllProducts');
    } else {
      EasyLoading.showError(controller.message, dismissOnTap: true);
    }
  }
}
