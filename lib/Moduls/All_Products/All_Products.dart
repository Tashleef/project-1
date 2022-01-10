import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:untitled6/Moduls/ProfileScreen/profileController.dart';
import 'package:untitled6/Moduls/ProfileScreen/profile_Screen.dart';
import 'package:untitled6/component/category_design.dart';
import 'package:untitled6/component/product_card.dart';
import 'package:untitled6/component/search_bar.dart';
import '../../constant.dart';
import 'All_ProdcutsController.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final controller =
  Get.put<All_Products_Controller>(All_Products_Controller());

  ScrollController scrollController = ScrollController();

  bool dragDown = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      setState(() {
        dragDown = scrollController.offset > 50;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }


  final categories = <String> ['All','Foods', 'Drinks', 'Medicine', 'Others'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/AddItem');
          },
          backgroundColor: kSecondryColor.withAlpha(230),
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Logging out'),
                content: const Text('are you sure you want to logout'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed('/Login');
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
            child: const Icon(
              Icons.exit_to_app,
              size: 35,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'BuyMe',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Center(
              child: Obx(
                () => Text(
                  'Welcome ${controller.name.value}!',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showAsBottomSheet(context, height, width);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 0),
                width: width * 0.2,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                    image: DecorationImage(
                        image: AssetImage('images/vector.jpg'))),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                  // animagting the search bar to go up when you scroll down
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: width * 0.9,
                    padding: EdgeInsets.only(top: (dragDown) ? 0 : 50),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width*0.8,
                          child: CustomTextField(
                            hidden: false,
                            icon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: 'Search for an item',
                            function: (value) {
                              controller.search.value = value;
                              if (controller.search.value != '') {
                                controller.searchButton();
                              }
                              else {
                                controller.normalMode();
                              }
                            },
                            color: kSecondryColor.withOpacity(0.1),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        PopupMenuButton(
                          color: kPrimaryColor,

                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {
                                controller.sortButton('price');
                              },
                              child: Row(
                                children: const <Widget> [
                                  Icon(Icons.sort),
                                  Text(
                                    '  Sort by price',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                  controller.sortButton('expire_date');
                              },
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.sort),
                                  Text(
                                    '  Sort by expire date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  controller.sortButton('like');
                                });
                              },
                              child: Row(
                                children: const <Widget> [
                                  Icon(Icons.sort),
                                  Text(
                                    '  Sort by likes',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                  controller.sortButton('seen');
                              },
                              child: Row(
                                children: const <Widget> [
                                  Icon(Icons.sort),
                                  Text(
                                    '  Sort by views',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                          child: const Icon(
                            Icons.filter_list,
                            size: 35,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // animating the Categories list to disappear when you scroll down
                AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: (dragDown) ? 0 : height * 0.05,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(()=> GestureDetector(
                                onTap: () {
                                  controller.selectedIndex.value = index;
                                    if(index!=0) {
                                      controller.categoryButton(categories[controller.selectedIndex.value]);
                                    }else{
                                      controller.normalMode();
                                    }
                                },
                                child: CategoriesList(
                                    category: categories[index],
                                    select: (controller.selectedIndex.value == index)
                                        ? kPrimaryColor
                                        : Colors.grey[400])),
                          );
                        })),
                const SizedBox(
                  height: 20,
                ),
                Stack(alignment: Alignment.topCenter, children: <Widget>[
                  // stacking the inner widget with the product list
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: (dragDown) ? height * 0.7 : height * 0.602,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: kSecondryColor, blurRadius: 20)
                        ],
                       gradient: LinearGradient(
                            colors: [
                              kSecondryColor,
                              kPrimaryColor
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: (dragDown) ? height * 0.64 : height * 0.56,
                          child: Obx(() {
                            if (controller.isLoading.value == true) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 5,
                                ),
                              );
                            }
                            return ListView.builder(
                                controller: scrollController,
                                itemCount: controller.allProductsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return MyProductCard(
                                    radius: 5.0,
                                    shadowColor: Colors.black,
                                    list: controller.allProductsList[index],
                                    index: index,
                                  );
                                });
                          })),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ));
  }

  Future showAsBottomSheet(context, height, width) async {
    return await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.37, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          ProfileController controller = Get.find();
          return Obx(() {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 5,
                ),
              );
            }
            return Profile(
              height: height,
              width: width,
              username: controller.name.value,
              myProduct: controller.ProfileProductsList.value,
            );
          });
        },
      );
    });
  }
}
