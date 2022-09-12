import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testcrm/src/model/http_result.dart';
import 'package:testcrm/src/model/send_order/send_order_model.dart';

class AppProvider {
  static String baseUrl = 'https://naqshsoft.site/';

  Future<HttpResult> _postRequest(String url, body) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(body);
    return _result(response);
  }


  Future<HttpResult> _getRequest(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    print(url);
    print(response.body);
    print(response.statusCode);
    return _result(response);
  }

  HttpResult _result(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
        return HttpResult(
        isSuccess: true,
        statusCode: response.statusCode,
        result: json.decode(utf8.decode(response.bodyBytes),),
      );
    } else {
      return HttpResult(
        isSuccess: false,
        statusCode: response.statusCode,
        result: response.body,
      );
    }
  }

  Future<HttpResult> login(String db, number, password) async {
    String url = '${baseUrl}login_tr3?DB=$db&username=$number&pass=$password&';
    return await _getRequest(url);
  }

  Future<HttpResult> getProducts(String db) async {
    String url = '${baseUrl}tip?DB=$db';
    return await _getRequest(url);
  }
  Future<HttpResult> getCourse(String db) async {
    String url = '${baseUrl}getkurs?DB=$db';
    return await _getRequest(url);
  }
  Future<HttpResult> getDetailProduct(String db,year,month ,int skl,id) async {
    String url = '${baseUrl}sklad01?DB=$db&YIL=$year&OY=$month&ID_SKL0=$skl&ID_TIP=$id';
    return await _getRequest(url);
  }

  Future<HttpResult> orderProducts(OrderModel order) async {
    String url = '${baseUrl}zakaz?DB=002&ID_T=001&SANA=2022-09-12&';
    return await _postRequest(url,json.encode(order));
  }
}
