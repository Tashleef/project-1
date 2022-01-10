import 'dart:io';

class AddProduct{

  var name,description,quantity,category,price,first_date,second_date,third_date,first_discount,second_discount,third_discount,expire_date;
  var img;
  AddProduct({
    this.name,
    this.description,
    this.quantity,
    this.category,
    this.price,
    this.first_date,
    this.first_discount,
    this.second_date,
    this.second_discount,
    this.third_date,
    this.third_discount,
    this.expire_date,
    this.img,
  });
}