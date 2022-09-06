import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testcrm/src/model/http_result.dart';

class AppProvider {
  static String baseUrl = 'https://naqshsoft.site/';

  Future<HttpResult> _getRequest(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
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
}