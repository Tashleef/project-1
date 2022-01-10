import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled6/Moduls/All_Products/All_Products.dart';
import 'package:untitled6/Moduls/SignUp/SignUp_Controller.dart';
import 'package:untitled6/component/search_bar.dart';
import 'package:untitled6/constant.dart';


class signup extends StatelessWidget {

  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    kPrimaryColor,
                    kSecondryColor
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: width*0.8,
                    child: CustomTextField(
                      icon: const Icon(
                        Icons.person,
                      ),
                      hintText: 'username',
                      function: (value){
                        controller.name = value;
                      },
                      hidden: false,
                    ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                    width: width*0.8,
                    child: CustomTextField(
                      icon: const Icon(
                        Icons.email,
                      ),
                      hintText: 'username@example.com',
                      function: (value){
                        controller.email = value;
                      },
                      hidden: false,
                    ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                    width: width*0.8,
                    child: CustomTextField(
                      icon: const Icon(Icons.lock_outline),
                      hintText: 'Password',
                      function: (value){
                        controller.password = value;
                      },
                      hidden: true,
                    )
                ),
                SizedBox(height: 25,),
                SizedBox(
                    width: width*0.8,
                    child: CustomTextField(
                      icon: const Icon(Icons.phone),
                      hintText: 'Phone Number',
                      function: (value){
                        controller.phone_number = value;
                      },
                      hidden: false,
                    )
                ),
                SizedBox(height:30),
                GestureDetector(
                  onTap: (){
                    OnClickRegister();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 120,right:120,top:12,bottom: 12),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: kFourthColor.withOpacity(0.6),
                    ),
                    child: Text(
                      'Register',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
    );
  }
  void OnClickRegister() async {
    EasyLoading.show(status: 'loading..');
   bool signed = await controller.RegisterButton();
   if(signed)
     {
       EasyLoading.showSuccess(controller.message ,dismissOnTap: true);
       Get.offNamed('/AllProducts');
     }
   else
     {
       EasyLoading.showError(controller.message , dismissOnTap: true);

     }
  }

}