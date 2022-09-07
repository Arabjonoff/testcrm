// To parse this JSON data, do
//
//     final wrehouseModel = wrehouseModelFromJson(jsonString);

import 'dart:convert';

DataModel wrehouseModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String wrehouseModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
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
    id: json["ID"],
    name: json["NAME"],
    st: json["ST"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NAME": name,
    "ST": st,
  };
}
