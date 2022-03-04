// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// create model from json: app.quicktype.io
// copy entire json and paste to app.quicktype.io

import 'package:get/get.dart';
import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
    this.count,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  dynamic rating;
  dynamic count;

  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"]["rate"],
        count: json["rating"]["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating,
        "count": count,
      };
}

// class Rating {
//   Rating({
//     this.rate,
//     this.count,
//   });
//
//   double rate;
//   int count;
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//     rate: json["rate"].toDouble(),
//     count: json["count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "rate": rate,
//     "count": count,
//   };
// }
