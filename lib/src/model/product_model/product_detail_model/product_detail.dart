// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

class ProductDetailModel {
  ProductDetailModel({
    required this.result,
  });

  List<DetailResult> result;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        result: json["data"] == null
            ? <DetailResult>[]
            :  List<DetailResult>.from(
                json["data"].map((x) => DetailResult.fromJson(x))),
      );
}

class DetailResult {
  DetailResult({
    required this.id,
    required this.name,
    required this.idSkl2,
    required this.idTip,
    required this.narhi,
    required this.snarhi,
    required this.osoni,
    required this.yil,
    required this.oy,
    required this.soni,
    this.count = 0,
  });

  int id;
  String name;
  dynamic idSkl2;
  dynamic idTip;
  dynamic narhi;
  dynamic snarhi;
  dynamic osoni;
  String yil;
  String oy;
  dynamic soni;
  int count;

  factory DetailResult.fromJson(Map<String, dynamic> json) =>
      DetailResult(
        id: json["ID"] ?? 0,
        name: json["NAME"] ?? "",
        idSkl2: json["ID_SKL2"] ?? 0,
        idTip: json["ID_TIP"] ?? 0,
        narhi: json["NARHI"] ?? 0,
        snarhi: json["SNARHI"] ?? 0,
        osoni: json["OSONI"] ?? 0,
        yil: json["YIL"] ?? "",
        oy: json["OY"] ?? "",
        soni: json["SONI"] ?? 0,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NAME": name,
    "NARHI": narhi,
    "OSONI": osoni,
    "count": count,
    "OY": oy,
    "YIL": yil,
    "SNARHI": snarhi,
    "ID_TIP": idTip,
    "ID_SKL2": idSkl2,
  };
}

