import 'package:testcrm/src/database/cart_database.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/model/send_order/send_order_model.dart';
import 'package:testcrm/src/provider/app_provider.dart';

import '../model/http_result.dart';

class Repository {
  final AppProvider _provider = AppProvider();
  final DataBaseCard _baseCard = DataBaseCard();

  Future<void> clear() => _baseCard.clear();

  Future<int> saveProductCard(DetailResult data) =>
      _baseCard.saveProductCart(data);

  Future<List<DetailResult>> getProductCart() => _baseCard.getProductCart();

  Future<int> updateProduct(DetailResult products) =>
      _baseCard.updateProduct(products);

  Future<int> deleteProductCard(int data) => _baseCard.deleteProductCard(data);

  Future<HttpResult> login(String db, number, password) =>
      _provider.login(db, number, password);

  Future<HttpResult> getProducts(String db) => _provider.getProducts(db);

  Future<HttpResult> orderProducts(OrderModel orderModel) => _provider.orderProducts(orderModel);

  Future<HttpResult> getCourse(String db) => _provider.getCourse(db);

  Future<HttpResult> getDetailProduct(String db, year, month, int skl, id) =>
      _provider.getDetailProduct(db, year, month, skl, id);
}
