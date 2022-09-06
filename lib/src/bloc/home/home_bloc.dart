import 'package:rxdart/subjects.dart';
import 'package:testcrm/src/model/http_result.dart';
import 'package:testcrm/src/model/product_model/products_model.dart';
import 'package:testcrm/src/repository/repository.dart';

class HomeBloc {
  final Repository _repository = Repository();
  final fetchProduct = PublishSubject<ProductsModel>();

  Stream<ProductsModel> get getProducts => fetchProduct.stream;

  getAllProducts(String db) async {
    HttpResult result = await _repository.getProducts(db);
    if (result.isSuccess) {
      ProductsModel productsModel = ProductsModel.fromJson(result.result);
      fetchProduct.sink.add(productsModel);
    }
  }
}

final homeBloc = HomeBloc();
