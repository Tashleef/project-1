import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled6/Moduls/Edit_Item/Edit_Item.dart';


bool isLiked = false;
int views_cnt = 0;
int likes_cnt = 4;
void main() {
  runApp(ProductDetails());
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
                      Color(0xffacb6e5),
                      Color(0xff86fde8),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    primary: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => edit_item()));
                            },
                            child: Expanded(
                              flex: 0,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: ww - 60,
                        height: hh - 550,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("images/ssss.jpg"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 380, bottom: 30),
                child: Container(
                  width: 400,
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 50),
                            child: Text(
                              'whey protein',
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60, top: 50),
                            child: Text(
                              '300k s.p',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: Text(
                          'Whey is the liquid remaining after milk has been curdled and strained. It is a byproduct of the manufacture of cheese or casein and has several commercial uses',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 20, right: 20, bottom: 20),
                              child: Expanded(
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Quantity :',
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '10',
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  width: 150,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 20, right: 20, bottom: 20),
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Expire Date :',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '22/6/2026',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                width: 150,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 0, right: 15, bottom: 10),
                              child: Container(
                                child: LikeButton(
                                  size: 40,
                                  isLiked: isLiked,
                                  likeCount: likes_cnt,
                                  likeBuilder: (isLiked) {
                                    final color =
                                    isLiked ? Colors.red : Colors.black;
                                    return Icon(Icons.favorite_border,
                                        color: color, size: 40);
                                  },
                                  countBuilder: (count, isLiked, text) {
                                    final color = Colors.black;
                                    return Text(text,
                                        style: TextStyle(
                                            color: color,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold));
                                  },
                                ),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.cyan[200],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 0, right: 20, bottom: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Icon(
                                    Icons.message_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan[200],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 0, right: 20, bottom: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan[200],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.cyan[200],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
