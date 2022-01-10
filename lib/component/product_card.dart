import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/Config/ConfigServer.dart';
import 'package:untitled6/Moduls/All_Products/All_ProdcutsController.dart';
import 'package:untitled6/Moduls/Product_Details/Product_Details.dart';
import 'package:untitled6/Moduls/Product_Details/Product_DetailsController.dart';
import 'package:untitled6/constant.dart';
import 'package:untitled6/native_service/secure_storage.dart';

class MyProductCard extends StatelessWidget {
  All_Products_Controller controller = Get.find();
  final radius;
  final shadowColor;
  final list;
  final index;
  MyProductCard({this.radius, this.shadowColor,this.list,this.index});
  @override
  Widget build(BuildContext context) {
 //   print(id);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        final controller = Get.put<ProductDetailsController>(ProductDetailsController());
        controller.getProductDetails(list.id);

        SecureStorage storage = SecureStorage();
        final id = await storage.read('id');
        Get.toNamed('/Details' , arguments: list);
      },
      child: Container(
        height: height * 0.16,
        width: width * 0.5,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: radius,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, top: height * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           const SizedBox(
              width: 15,
            ),
            Center(
                child: Container(
                  height: height * 0.10,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                      image:(list.imgUrl != null)? DecorationImage(
                          image: NetworkImage( ServerConfig.DomainNameServer + '/${list.imgUrl}')
                      ):null),
                )
            ),
           const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                 const   SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${list.name}',
                      overflow: TextOverflow.ellipsis,
                      style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children:  <Widget>[
                        const Text('Available: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        Text('${list.price}',
                        style:const TextStyle(
                          color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w800
                        ),),
                       const  SizedBox(width: 10,),
                        const Text('in stock: ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                         Text('${list.quantity}',
                          style:const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.w800
                          ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${list.seen}',
                          style: TextStyle(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${list.like}',
                          style: const TextStyle(),
                        ),
                        const SizedBox(
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