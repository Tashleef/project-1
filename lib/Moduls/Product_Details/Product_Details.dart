import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Moduls/All_Products/All_ProdcutsController.dart';
import 'package:untitled6/Moduls/Product_Details/Product_DetailsController.dart';
import 'package:untitled6/Moduls/comments/comments_controller.dart';
import 'package:untitled6/component/comment_card.dart';
import 'package:untitled6/component/search_bar.dart';
import 'package:untitled6/constant.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class ProductDetails extends StatelessWidget {
  final list = Get.arguments;
  //var list = arg[0];
  final id = 1;
  final controller1 = CommentController();
  final controller = ProductDetailsController();
  @override
  Widget build(BuildContext context) {
    print(list);
    //print(index);
    //print(controller.allProductsList[index]);
    double ww = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    kPrimaryColor,
                    kPrimaryColor,
                    kSecondryColor,
                    kSecondryColor,
                    kSecondryColor
                  ],
                ),
                color: Colors.white),
          ),
          Container(
            height: hh * 0.4,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed('/AllProducts');
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                        size: 25.0,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const CircleBorder(),
                          primary: Colors.white),
                    ),
                    SizedBox(
                      width: ww * 0.5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Get.toNamed(
                          '/EditItem',
                          arguments: list.id,
                        );
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ww * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {
                        onClickDeleteItem(list.id);
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: ww * 0.5,
                  height: hh * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            ServerConfig.DomainNameServer + '/${list.imgUrl}'),
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: hh * 0.42,
            ),
            child: Container(
              height: hh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: Text(
                              '${list.name}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                              children: <Widget>[
                                const Text(
                                  'Available: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${list.price}',
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'in stock: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${list.quantity}',
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '${list.description}',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Expire Date: ${list.expireDate}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 0, right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.LikeButton(list.id);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  size: 40,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                list.like.toString(),
                                style: const TextStyle(fontSize: 25),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 0, right: 20, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            controller1.showComments(list.id);
                            showAsBottomSheet(context, hh, ww);
                          },
                          child: Icon(
                            Icons.message,
                            color: Colors.grey.shade300,
                            size: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 0, right: 20, bottom: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey.shade300,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${list.seen}',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Future showAsBottomSheet(context, height, width) async {
    return await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [1.0],
          positioning: SnapPositioning.relativeToSheetHeight,
        ),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Stack(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: height * 0.4,
                    child: Obx(
                      () => (!controller1.loading.value)
                          ? ListView.builder(
                              itemCount: controller1.commetnStatus.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: CommentCard(
                                    height: height,
                                    width: width,
                                    comment: controller1.commetnStatus[index]
                                        [0],
                                    userName: controller1.commetnStatus[index]
                                        [1],
                                  ),
                                );
                              })
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 5,
                              ),
                            ),
                    ),
                  )
                ]),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Container(
                          width: width * 0.8,
                          height: height * 0.1,
                          child: CustomTextField(
                            icon: Icon(
                              Icons.message_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: 'Add Comment',
                            hidden: false,
                            color: kPrimaryColor.withOpacity(0.2),
                            function: (value) {
                              controller1.comment.value = value;
                              print(value);
                            },
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller1.commentButton(
                            controller1.comment.value, list.id);
                        controller1.showComments(list.id);
                        controller1.comment.value = '';
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.7, top: height * 0.015),
                        child: Icon(
                          Icons.send_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }

  void onClickDeleteItem(id) async {
    EasyLoading.show(status: 'loading..');
    await controller.deleteItemButton(id);
    if (controller.editItemStatus.value) {
      EasyLoading.showSuccess(controller.message.value, dismissOnTap: true);
      Get.offAllNamed('/AllProducts');
    } else {
      EasyLoading.showError(controller.message.value, dismissOnTap: true);
    }
  }
}
