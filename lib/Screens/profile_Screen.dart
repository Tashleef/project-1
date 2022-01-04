import 'package:flutter/material.dart';
import 'package:untitled6/Moduls/Login/login.dart';
import 'package:untitled6/component/product_card.dart';
import 'package:untitled6/constant.dart';
class Profile extends StatelessWidget {
  final height;
  final width;
  final username;
  Profile({this.height,this.width,this.username});
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        color: Colors.white,
        height: height*0.9,
        child: Column(
          children: <Widget> [

            Container(
              height: height*0.05,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
           Center(
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 5),
               height: height*0.25,
               width: width*0.5,
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage('images/vector.jpg')
                   )
               ),
             ),
           ),
            Text(
              'You look fresh today $username',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(height:10),
            Text(
              'Here are your products',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              children: [
                Container(
                  height:height * 0.45,
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
                  margin: EdgeInsets.only(top: 20),
                  height: height*0.42,
                  child: ListView.builder(itemBuilder: (context,index){
                    return MyProductCard(radius: 20.0,shadowColor: kPrimaryColor,);
                  }),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}