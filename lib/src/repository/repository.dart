import 'package:testcrm/src/provider/app_provider.dart';

import '../model/http_result.dart';

class Repository{
  final AppProvider _provider = AppProvider();

  Future<HttpResult> login(String db,number,password) => _provider.login(db, number, password);

  Future<HttpResult> getProducts(String db) => _provider.getProducts(db);

  Future<HttpResult> getCourse(String db) => _provider.getCourse(db);

  Future<HttpResult> getDetailProduct(String db,year,month,int skl,id) => _provider.getDetailProduct(db,year,month, skl,id);
}