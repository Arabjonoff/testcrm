// To parse this JSON data, do
//
//     final usdModel = usdModelFromJson(jsonString);

import 'dart:convert';

UsdModel usdModelFromJson(String str) => UsdModel.fromJson(json.decode(str));


class UsdModel {
  UsdModel({
    required this.status,
    required this.kurs,
    required this.tel1,
    required this.tel2,
    required this.boss,
    required this.buh,
    required this.manzil,
    required this.ver,
    this.sana,
    this.st,
    required this.name,
    required this.sm,
    required this.vl,
    required this.ftSum,
    required this.ftVal,
    required this.ftSoni,
    required this.sms,
    this.haridortel,
    required this.bot,
  });

  bool status;
  int kurs;
  String tel1;
  String tel2;
  String boss;
  String buh;
  String manzil;
  String ver;
  dynamic sana;
  dynamic st;
  String name;
  int sm;
  int vl;
  String ftSum;
  String ftVal;
  String ftSoni;
  int sms;
  dynamic haridortel;
  int bot;

  factory UsdModel.fromJson(Map<String, dynamic> json) => UsdModel(
    status: json["STATUS"]??false,
    kurs: json["KURS"]??0,
    tel1: json["TEL1"]??"",
    tel2: json["TEL2"]??"",
    boss: json["BOSS"]??"",
    buh: json["BUH"]??"",
    manzil: json["MANZIL"]??"",
    ver: json["VER"]??"",
    sana: json["SANA"],
    st: json["ST"],
    name: json["NAME"]??"",
    sm: json["SM"]??0,
    vl: json["VL"]??0,
    ftSum: json["FT_SUM"]??"",
    ftVal: json["FT_VAL"]??"",
    ftSoni: json["FT_SONI"]??"",
    sms: json["SMS"]??0,
    haridortel: json["HARIDORTEL"],
    bot: json["BOT"]??0,
  );

}
