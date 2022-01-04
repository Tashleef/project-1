import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Additem extends StatelessWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Item',
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
        body: addpage(),
      ),
    );
  }
}
class addpage extends StatefulWidget {
  const addpage({Key? key}) : super(key: key);

  @override
  _addpageState createState() => _addpageState();
}
String dropdownValue = 'category';
class _addpageState extends State<addpage> {
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
    return Stack(
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
        ListView(
          children: <Widget>[
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
                          Icons.camera_alt_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(color: Colors.grey),
                      underline: Container(
                        height: 1,
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
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'price',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'quantity',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '1st date',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '1st discount',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '2nd date',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '2nd discount',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '3rd date',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:20,right: 10),
                    padding: EdgeInsets.only(left:30,right:30,top: 0,bottom: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '3rd discount',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
                        hintText: 'Expire Date',
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
              height: 10,
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
                        hintText: 'Description',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
