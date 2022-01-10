
import 'dart:convert';

Profile profileProductsFromJson(String str) => Profile.fromJson(json.decode(str));


class Profile {
  Profile({
    //required this.message,
    required this.userName,
    required this.profileProducts,
  });
  String userName;
 // String message;
  List<ProfileProducts> profileProducts;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    userName: json["user name"],
    //message: json["message"],
    profileProducts: List<ProfileProducts>.from(json["products"].map((x) => ProfileProducts.fromJson(x))),
  );

}

class ProfileProducts {
  ProfileProducts({
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


  factory ProfileProducts.fromJson(Map<String, dynamic> json) => ProfileProducts(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    description: json["description"],
    price: json["price"],
    imgUrl: json["img_url"],
    quantity: json["quantity"],
    expireDate: DateTime.parse(json["expire_date"]),
    firstDate: DateTime.parse(json["first_date"]),
    secondDate: DateTime.parse(json["second_date"]),
    thirdDate: DateTime.parse(json["third_date"]),
    firstDiscount: json["first_discount"],
    secondDiscount: json["second_discount"],
    thirdDiscount: json["third_discount"],
    currentPrice: json["current_price"],
    seen: json["seen"],
    like: json["like"],
    userId: json["user_id"],
  );
}