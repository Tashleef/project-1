import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/Moduls/All_Products/All_Products.dart';
import 'dart:io';

import 'package:untitled6/main.dart';

class edititem extends StatelessWidget {
  const edititem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Item',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
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
        body: edit_item(),
      ),
    );
  }
}
class edit_item extends StatefulWidget {
  const edit_item({Key? key}) : super(key: key);

  @override
  _edit_itemState createState() => _edit_itemState();
}
String dropdownValue = 'category';

class _edit_itemState extends State<edit_item> {

  File? image;
  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null)
      return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image=imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    double ww = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: <Widget>[
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
            ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                        ),
                        child: image!= null ? Image.file(image!,
                          fit: BoxFit.cover,
                        ): CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150,top: 150),
                        child: FlatButton(
                          onPressed: () => pickImage(),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                      SizedBox(width:10),
                      Container(
                        width:ww-180,
                        child:const TextField(
                          decoration: InputDecoration(
                            hintText: 'name',
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
                  height: 20,
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
                      SizedBox(width:10),
                      Container(
                        width:ww-180,
                        child:const TextField(
                          decoration: InputDecoration(
                            hintText: 'quantity',
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
                  height: 20,
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
                      SizedBox(width:10),
                      Container(
                        width: ww-180,
                        child:const TextField(
                          decoration: InputDecoration(
                            hintText: 'price',
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
                  height: 20,
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
                      SizedBox(width:10),
                      Container(
                        width:ww-180,
                        child:DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['category', 'Tech', 'Food','Drinks', 'Others']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 50,right:50,top:10,bottom: 10),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurpleAccent,
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.montserrat(
                        //fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 40,right:40,top:10,bottom: 10),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.montserrat(
                        //fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
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
}
