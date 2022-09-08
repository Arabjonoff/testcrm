import 'package:rxdart/rxdart.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/repository/repository.dart';

import '../../model/http_result.dart';

class ProductDetailBloc{
  final Repository _repository = Repository();

  final fetchDetailProduct = PublishSubject<ProductDetailModel>();

  Stream<ProductDetailModel> get getDetailProducts => fetchDetailProduct.stream;

  getAllProducts(String db,year,month,int skl,id) async {
    HttpResult response = await _repository.getDetailProduct(db,year,month,skl,id);
    if (response.isSuccess) {
      ProductDetailModel productDetailModel = ProductDetailModel.fromJson(response.result);
      fetchDetailProduct.sink.add(productDetailModel);
    }
  }
}
final productDetailBloc = ProductDetailBloc();