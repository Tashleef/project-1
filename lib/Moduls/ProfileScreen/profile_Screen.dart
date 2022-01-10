import 'package:flutter/material.dart';
import 'package:untitled6/Moduls/All_Products/All_ProdcutsController.dart';
import 'package:untitled6/Moduls/Login/login.dart';
import 'package:untitled6/component/product_card.dart';
import 'package:untitled6/constant.dart';
class Profile extends StatelessWidget {
  final height;
  final width;
  final username;
  final myProduct;
  Profile({this.height,this.width,this.username,this.myProduct});
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        color: Colors.white,
        height: height*0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Align(
              child: Container(
                alignment: Alignment.topCenter,
                height: height*0.05,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
           Center(
             child: Container(
               margin:const EdgeInsets.symmetric(vertical: 5),
               height: height*0.25,
               width: width*0.5,
               decoration:const  BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage('images/vector.jpg')
                   )
               ),
             ),
           ),
            Text(
              'You look fresh today $username',
              style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            const SizedBox(height:10),
            const Text(
              'Here are your products',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: kSecondryColor, blurRadius: 20)
                        ],
                        gradient: LinearGradient(colors: [kPrimaryColor,kSecondryColor]),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                        itemCount: myProduct.length,
                        itemBuilder: (context,index){
                      return MyProductCard(radius: 20.0,shadowColor: kPrimaryColor,
                      list: myProduct[index],);
                    }),
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}