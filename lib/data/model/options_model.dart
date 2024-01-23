// To parse this JSON data, do
//
//     final optionsModel = optionsModelFromJson(jsonString);

import 'dart:convert';

OptionsModel optionsModelFromJson(String str) =>
    OptionsModel.fromJson(json.decode(str));

String optionsModelToJson(OptionsModel data) => json.encode(data.toJson());

class OptionsModel {
  String title;

  List<Item> items;

  OptionsModel({
    required this.title,
    required this.items,
  });

  factory OptionsModel.fromJson(Map<String, dynamic> json) => OptionsModel(
        title: json["title"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String text;
  bool selected;
  String price;

  Item({
    required this.text,
    required this.selected,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        text: json["text"],
        price: json["price"],
        selected: false,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "price": price,
      };
}

class SelectedModel {
  String text;
  int id;
  double price;
  String title;

  SelectedModel({
    required this.text,
    required this.id,
    required this.title,
    required this.price,
  });
}
