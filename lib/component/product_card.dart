import 'package:flutter/material.dart';
import 'package:untitled6/Moduls/Product_Details/Product_Details.dart';
import 'package:untitled6/constant.dart';


class MyProductCard extends StatelessWidget {
  final radius;
  final shadowColor;
  int pice=200;
  MyProductCard({this.radius , this.shadowColor});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
      },
      child: Container(
        height: height * 0.16,
        width: width * 0.5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor
                ,
                blurRadius: radius,
              )
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
            left: width * 0.05,right: width*0.05, top: height * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Center(
                child: Container(
                  height: height*0.10,
                  width: width*0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/firstshoe.jpg')
                      )
                  ),
                )
            ),
            SizedBox(
              width: 15,
            ),

            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text(
'Product Name',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'price $pice',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'category',
                      style: TextStyle(fontSize: 15),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.visibility,
                          size: 20,
                          color: kDetailsColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('5',
                          style: TextStyle(
                              color: kDetailsColor
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 20,
                          color: kDetailsColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('5',
                          style: TextStyle(
                              color: kDetailsColor
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}