import 'dart:convert';
AllProducts allProductFromJson(String str) => AllProducts.fromJson(json.decode(str));

class AllProducts {
  AllProducts({
    required this.message,
    required this.userName,
    required this.products,
  });
  String message;
  String userName;
  List<Product> products;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
    userName: json["user name"],
    message: json["message"],
    products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
  );

}
Product ProductFromJson(String str) => Product.fromJson(json.decode(str));
class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.quantity,
    required this.expireDate,
    required this.firstDate,
    required this.secondDate,
    required this.thirdDate,
    required this.firstDiscount,
    required this.secondDiscount,
    required this.thirdDiscount,
    required this.currentPrice,
    required this.seen,
    required this.like,
    required this.userId,
  });

  var id;
  var name;
  var category;
  var description;
  var price;
  var imgUrl;
  var quantity;
  var expireDate;
  var firstDate;
  var secondDate;
  var thirdDate;
  var firstDiscount;
  var secondDiscount;
  var thirdDiscount;
  var currentPrice;
  var seen;
  var like;
  var userId;


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    description: json["description"],
    price: json["current_price"],
    imgUrl: json["img_url"],
    quantity: json["quantity"],
    expireDate: json["expire_date"],
    firstDate: json["first_date"],
    secondDate: json["second_date"],
    thirdDate: json["third_date"],
    firstDiscount: json["first_discount"],
    secondDiscount: json["second_discount"],
    thirdDiscount: json["third_discount"],
    currentPrice: json["current_price"],
    seen: json["seen"],
    like: json["like"],
    userId: json["user_id"],
  );
}