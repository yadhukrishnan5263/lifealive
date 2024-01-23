// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  String title;
  String subtitle;
  List<Item> items;

  MenuModel({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    title: json["title"],
    subtitle: json["subtitle"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String dName;
  String image;
  String description;
  String price;
  List<String> category;

  Item({
    required this.dName,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    dName: json["d_name"],
    image: json["image"],
    description: json["description"],
    price: json["price"],
    category: List<String>.from(json["category"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "d_name": dName,
    "image": image,
    "description": description,
    "price": price,
    "category": List<dynamic>.from(category.map((x) => x)),
  };
}
