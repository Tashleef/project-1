import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Moduls/Login/Login.dart';
import 'package:untitled6/Screens/profile_Screen.dart';
import 'package:untitled6/Moduls/Add_Item/Add_Item.dart';
import 'package:untitled6/component/category_design.dart';
import 'package:untitled6/component/product_card.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:untitled6/component/search_bar.dart';
import 'package:untitled6/constant.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int selectedIndex = 0;
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

  final categories = [
    "all",
    "shoes",
    "sofa",
    "others",
  ];

  String username = "Faek";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Additem()));
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Logging out'),
                content: Text('are you sure you want to logout'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
            child: Icon(
              Icons.exit_to_app,
              size: 35,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Productive',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Center(
                child: Text(
                  'Welcome $username!',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            GestureDetector(
              onTap: () {
                showAsBottomSheet(context, height, width);
              },
              child: Container(
                margin: EdgeInsets.only(left: 0),
                width: width * 0.2,
                decoration: BoxDecoration(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  // animagting the search bar to go up when you scroll down
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: width * 0.9,
                    padding: EdgeInsets.only(top: (dragDown) ? 0 : 50),
                    child: CustomTextField(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Search for an item',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // animating the Categories list to disappear when you scroll down
                AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: (dragDown) ? 0 : height * 0.05,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: CategoriesList(
                                  category: categories[index],
                                  select: (selectedIndex == index)
                                      ? kPrimaryColor
                                      : Colors.grey[400]));
                        })),
                SizedBox(
                  height: 20,
                ),
                Stack(alignment: Alignment.topCenter, children: <Widget>[
                  // stacking the inner widget with the product list
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: (dragDown) ? height * 0.7 : height * 0.602,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: kSecondryColor, blurRadius: 20)
                        ],
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                  ),
                  Container(
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: (dragDown) ? height * 0.64 : height * 0.56,
                        child: ListView.builder(
                            controller: scrollController,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return MyProductCard(
                                  radius: 5.0, shadowColor: Colors.black);
                            }),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),

        )
    );
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
          return Profile(
            height: height,
            width: width,
            username: username,
          );
        },
      );
    });
  }
}
