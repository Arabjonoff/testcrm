import 'package:testcrm/src/provider/app_provider.dart';

import '../model/http_result.dart';

class Repository{
  final AppProvider _provider = AppProvider();

  Future<HttpResult> login(String db,number,int password) => _provider.login(db, number, password);
}