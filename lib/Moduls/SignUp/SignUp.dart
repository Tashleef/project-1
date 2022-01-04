import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled6/Moduls/All_Products/All_Products.dart';
import 'package:untitled6/Moduls/SignUp/SignUp_Controller.dart';


class signup extends StatelessWidget {

  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff86fde8),
          leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
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
                Container(
                  margin: EdgeInsets.only(left:50,right: 50,),
                  padding: EdgeInsets.only(left:30,right:30,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.email_outlined),
                      SizedBox(width:10),
                      Container(
                        width:150,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                           controller.email=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
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
                  margin: EdgeInsets.only(left:50,right: 50,),
                  padding: EdgeInsets.only(left:30,right:30,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person_outline),
                      SizedBox(width:10),
                      Container(
                        width:150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            controller.name=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your PhoneNumebr',
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
                  margin: EdgeInsets.only(left:50,right: 50,),
                  padding: EdgeInsets.only(left:30,right:30,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person_outline),
                      SizedBox(width:10),
                      Container(
                        width:150,
                        child: TextFormField(
                          onChanged: (value) {
                            controller.name=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Username',
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
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(left:50,right: 50,),
                  padding: EdgeInsets.only(left:30,right:30,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person_outline),
                      SizedBox(width:10),
                      Container(
                        width:150,
                        child: TextFormField(
                          onChanged: (value) {
                            controller.name=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:50,right: 50,),
                  padding: EdgeInsets.only(left:30,right:30,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.lock_open_outlined),
                      SizedBox(width:10),
                      Container(
                        width:150,
                        child: TextField(
                          onChanged: (value) {
                            controller.password=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
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
                      color: Colors.deepPurpleAccent,
                    ),
                    child: Text(
                      'Register',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
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
  void OnClickRegister() async {
    EasyLoading.show(status: 'loading..');
   await controller.RegisterButton();
   if(controller.SignUpStatus)
     {
       EasyLoading.showSuccess(controller.message ,dismissOnTap: true);
       Get.offNamed('/Login');
     }
   else
     {
       EasyLoading.showError(controller.message , dismissOnTap: true);

     }
  }

}

