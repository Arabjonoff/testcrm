// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  ProductsModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.st,
  });

  int id;
  String name;
  int st;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"]??0,
    name: json["NAME"]??"",
    st: json["ST"]??0,
  );
}
