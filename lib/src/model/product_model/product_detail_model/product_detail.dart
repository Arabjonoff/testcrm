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
    required this.idFirma,
    required this.idEdiz,
    required this.narhi,
    required this.narhiS,
    required this.snarhi,
    required this.snarhiS,
    required this.snarhi1,
    required this.snarhi1S,
    required this.snarhi2,
    required this.snarhi2S,
    required this.ksoni,
    required this.ksm,
    required this.ksmS,
    required this.psoni,
    required this.psm,
    required this.psmS,
    required this.rsoni,
    required this.rsm,
    required this.rsmS,
    required this.hsoni,
    required this.hsm,
    required this.hsmS,
    required this.vsoni,
    required this.vsm,
    required this.vsmS,
    required this.vzsoni,
    required this.vzsm,
    required this.vzsmS,
    required this.psksoni,
    required this.psksm,
    required this.psksmS,
    required this.rsksoni,
    required this.rsksm,
    required this.rsksmS,
    required this.osoni,
    required this.osm,
    required this.osmS,
    required this.osmT,
    required this.osmTS,
    required this.ksmT,
    required this.ksmTS,
    required this.yil,
    required this.oy,
    required this.idSkl0,
    required this.foyda,
    required this.foydaS,
    required this.soni,
    required this.vz,
    required this.count,
  });

  int id;
  String name;
  dynamic idSkl2;
  dynamic idTip;
  dynamic idFirma;
  dynamic idEdiz;
  dynamic narhi;
  dynamic narhiS;
  dynamic snarhi;
  dynamic snarhiS;
  dynamic snarhi1;
  dynamic snarhi1S;
  dynamic snarhi2;
  dynamic snarhi2S;
  dynamic ksoni;
  dynamic ksm;
  dynamic ksmS;
  dynamic psoni;
  dynamic psm;
  dynamic psmS;
  dynamic rsoni;
  dynamic rsm;
  dynamic rsmS;
  dynamic hsoni;
  dynamic hsm;
  dynamic hsmS;
  dynamic vsoni;
  dynamic vsm;
  dynamic vsmS;
  dynamic vzsoni;
  dynamic vzsm;
  dynamic vzsmS;
  dynamic psksoni;
  dynamic psksm;
  dynamic psksmS;
  dynamic rsksoni;
  dynamic rsksm;
  dynamic rsksmS;
  dynamic osoni;
  dynamic osm;
  dynamic osmS;
  dynamic osmT;
  dynamic osmTS;
  dynamic ksmT;
  dynamic ksmTS;
  String yil;
  String oy;
  dynamic idSkl0;
  dynamic foyda;
  dynamic foydaS;
  dynamic soni;
  dynamic vz;
  int count;

  factory DetailResult.fromJson(Map<String, dynamic> json) =>
      DetailResult(
        id: json["ID"] ?? 0,
        name: json["NAME"] ?? "",
        idSkl2: json["ID_SKL2"] ?? 0,
        idTip: json["ID_TIP"] ?? 0,
        idFirma: json["ID_FIRMA"] ?? 0,
        idEdiz: json["ID_EDIZ"] ?? 0,
        narhi: json["NARHI"] ?? 0,
        narhiS: json["NARHI_S"] ?? 0,
        snarhi: json["SNARHI"] ?? 0,
        snarhiS: json["SNARHI_S"] ?? 0,
        snarhi1: json["SNARHI1"] ?? 0,
        snarhi1S: json["SNARHI1_S"] ?? 0,
        snarhi2: json["SNARHI2"] ?? 0,
        snarhi2S: json["SNARHI2_S"] ?? 0,
        ksoni: json["KSONI"] ??0,
        ksm: json["KSM"] ?? 0,
        ksmS: json["KSM_S"] ?? 0,
        psoni: json["PSONI"] ?? 0,
        psm: json["PSM"] ?? 0,
        psmS: json["PSM_S"] ?? 0,
        rsoni: json["RSONI"] ?? 0,
        rsm: json["RSM"] ?? 0,
        rsmS: json["RSM_S"] ?? 0,
        hsoni: json["HSONI"] ?? 0,
        hsm: json["HSM"] ?? 0,
        hsmS: json["HSM_S"] ?? 0,
        vsoni: json["VSONI"] ?? 0,
        vsm: json["VSM"] ?? 0,
        vsmS: json["VSM_S"] ?? 0,
        vzsoni: json["VZSONI"] ?? 0,
        vzsm: json["VZSM"] ?? 0,
        vzsmS: json["VZSM_S"] ?? 0,
        psksoni: json["PSKSONI"] ?? 0,
        psksm: json["PSKSM"] ?? 0,
        psksmS: json["PSKSM_S"] ?? 0,
        rsksoni: json["RSKSONI"] ?? 0,
        rsksm: json["RSKSM"] ?? 0,
        rsksmS: json["RSKSM_S"] ?? 0,
        osoni: json["OSONI"] ?? 0,
        osm: json["OSM"] ?? 0,
        osmS: json["OSM_S"] ?? 0,
        osmT: json["OSM_T"] ?? 0,
        osmTS: json["OSM_T_S"] ?? 0,
        ksmT: json["KSM_T"] ?? 0,
        ksmTS: json["KSM_T_S"] ?? 0,
        yil: json["YIL"] ?? "",
        oy: json["OY"] ?? "",
        idSkl0: json["ID_SKL0"] ?? 0,
        foyda: json["FOYDA"] ?? 0,
        foydaS: json["FOYDA_S"] ?? 0,
        soni: json["SONI"] ?? 0,
        vz: json["VZ"] ?? 0.0,
        count: json["count"] ?? 0,
      );
}
