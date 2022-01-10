//     final allProducts = allProductsFromJson(jsonString);

import 'dart:convert';

AllProducts allProductsFromJson(String str) => AllProducts.fromJson(json.decode(str));

class AllProducts {
  AllProducts({
    required this.comments,
  });

  List<Comment> comments;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

}

class Comment {
  Comment({
    required this.id,
    required this.comment,
    required this.userName,
  });

  int id;
  String comment;
  String userName;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    comment: json["comment"],
    userName: json["user_name"],
  );

}