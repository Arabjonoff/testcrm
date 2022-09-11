// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.data,
  });

  List<OrderResult> data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    data: List<OrderResult>.from(json["data"].map((x) => OrderResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderResult {
  OrderResult({
    required this.id,
    required this.name,
    required this.ndoc,
    required this.idToch,
    required this.izoh,
    required this.dt,
    required this.sm,
    required this.tzakaz1,
  });

  int id;
  String name;
  String ndoc;
  String idToch;
  String izoh;
  DateTime dt;
  int sm;
  List<Tzakaz1> tzakaz1;

  factory OrderResult.fromJson(Map<String, dynamic> json) => OrderResult(
    id: json["ID"]??0,
    name: json["NAME"]??'',
    ndoc: json["NDOC"]??'',
    idToch: json["ID_TOCH"]??'',
    izoh: json["IZOH"]??'',
    dt: DateTime.parse(json["DT"]),
    sm: json["SM"]??'',
    tzakaz1: List<Tzakaz1>.from(json["TZAKAZ1"].map((x) => Tzakaz1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NAME": name,
    "NDOC": ndoc,
    "ID_TOCH": idToch,
    "IZOH": izoh,
    "DT": "${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}",
    "SM": sm,
    "TZAKAZ1": List<dynamic>.from(tzakaz1.map((x) => x.toJson())),
  };
}

class Tzakaz1 {
  Tzakaz1({
    required this.name,
    required this.idSkl2,
    required this.soni,
    required this.narhi,
    required this.snarh,
    required this.sm,
  });

  String name;
  int idSkl2;
  int soni;
  int narhi;
  int snarh;
  int sm;

  factory Tzakaz1.fromJson(Map<String, dynamic> json) => Tzakaz1(
    name: json["NAME"]??'',
    idSkl2: json["ID_SKL2"]??0,
    soni: json["SONI"]??0,
    narhi: json["NARHI"]??0,
    snarh: json["SNARH"]??0,
    sm: json["SM"]??0,
  );

  Map<String, dynamic> toJson() => {
    "NAME": name,
    "ID_SKL2": idSkl2,
    "SONI": soni,
    "NARHI": narhi,
    "SNARH": snarh,
    "SM": sm,
  };
}
