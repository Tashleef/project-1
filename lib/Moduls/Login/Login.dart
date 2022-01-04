import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled6/Moduls/SignUp/SignUp.dart';
import 'package:get/get.dart';
import 'Login_Controller.dart';

class Login extends StatelessWidget {
  late bool isSelected = controller.checkBoxStatus.value;
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
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
                        colors: [
                          Color(0xffacb6e5),
                          Color(0xff86fde8),
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 250),
                          child: Container(
                            child: Text(
                              'Login',
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
                        Container(
                          margin: EdgeInsets.only(
                            left: 50,
                            right: 50,
                          ),
                          padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.email_outlined),
                              SizedBox(width: 10),
                              Container(
                                width: 200,
                                child: TextField(
                                  onChanged: (value) {
                                    controller.email = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 50),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.lock_open_outlined),
                              SizedBox(width: 10),
                              Container(
                                width: 200,
                                child: TextField(
                                  onChanged: (value) {
                                    controller.password = value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Obx((){
                          return GestureDetector(
                            onTap: () {
                              controller.changeCheckBox();
                            },
                            child: AnimatedContainer(
                              duration: Duration(microseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: isSelected!
                                      ? Colors.cyan
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: isSelected!
                                      ? null
                                      : Border.all(
                                          color: Colors.white,
                                          width: 1.5,
                                        )),
                            ),
                          );
                        }),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () {
                            OnClickLogin();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.deepPurpleAccent,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Text(
                            'dont have an account ?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          onPressed: () {
                            Get.toNamed('SignUp');
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.deepPurpleAccent,
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 280,
                        child: Image(
                          image: AssetImage('images/shoppic.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void OnClickLogin() async {
    EasyLoading.show(status: 'loading..');
    await controller.LoginButton();
    if(controller.LoginStatus)
    {
      EasyLoading.showSuccess(controller.message ,dismissOnTap: true);
      Get.offAllNamed('/AllProducts');
    }
    else
    {
      EasyLoading.showError(controller.message , dismissOnTap: true);

    }
  }
}
