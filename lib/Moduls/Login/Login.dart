import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled6/Moduls/SignUp/SignUp.dart';
import 'package:get/get.dart';
import 'package:untitled6/component/search_bar.dart';
import 'package:untitled6/constant.dart';
import 'Login_Controller.dart';

class Login extends StatelessWidget {
  final LoginController controller = Get.find();
  late bool isSelected = controller.checkBoxStatus.value;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [kPrimaryColor, kSecondryColor],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.35),
                        child: const Text(
                            'Welcome to BuyMe',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: width * 0.8,
                        child: CustomTextField(
                          icon: const Icon(
                            Icons.email,
                          ),
                          hintText: 'username@example.com',
                          function: (value) {
                            controller.email.value = value;
                          },
                          hidden: false,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: width * 0.8,
                        child: CustomTextField(
                          icon: const Icon(
                            Icons.lock_outline,
                          ),
                          hintText: 'Password',
                          function: (value) {
                            controller.password.value = value;
                          },
                          hidden: true,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          onClickLogin();
                        },
                        child: Container(
                          padding:  EdgeInsets.only(
                              left: 50, right: 50, top: 10, bottom: 10),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: kFourthColor.withOpacity(0.6),
                            ),

                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'don\'t have an account ?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('SignUp');
                        },
                        child: Container(
                          padding:  EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 10),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: kFourthColor.withOpacity(0.6),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 235,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height * 0.4,
                      child: const Image(
                        image: AssetImage('images/shoppic.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  void onClickLogin() async {
    var ok = await controller.LoginButton();
    if (ok) {
      EasyLoading.showSuccess(controller.message, dismissOnTap: true);
      Get.offAllNamed('/AllProducts');
    } else {
      EasyLoading.showError(controller.message, dismissOnTap: true);
    }
  }
}
