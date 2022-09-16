import 'package:rxdart/rxdart.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/repository/repository.dart';

import '../../model/http_result.dart';

class ProductDetailBloc{
  final Repository _repository = Repository();

  final fetchDetailProduct = PublishSubject<ProductDetailModel>();
  ProductDetailModel data = ProductDetailModel.fromJson({});

  Stream<ProductDetailModel> get getDetailProducts => fetchDetailProduct.stream;

  getAllProducts(String db,year,month,int skl,id) async {
    HttpResult response = await _repository.getDetailProduct(db,year,month,skl,id);
    List<DetailResult> databaseCard = await _repository.getProductCart();
    if (response.isSuccess) {
      data = ProductDetailModel.fromJson(response.result);
      for (int i = 0; i < data.result.length; i++) {
        for (int j = 0; j < databaseCard.length; j++) {
          if (data.result[i].id == databaseCard[j].id) {
            data.result[i].count = databaseCard[j].count;
          }
        }
      }
      fetchDetailProduct.sink.add(data);
    }
  }
  updateCart(DetailResult detailResult ,bool remove)async{
    if(remove){
      detailResult.count--;
      if(detailResult.count == 0){
        await _repository.deleteProductCard(detailResult.id);
      }
      else{
        await _repository.updateProduct(detailResult);
      }
    }
    else{
      detailResult.count++;
      if(detailResult.count == 1){
        await _repository.saveProductCard(detailResult);
      }
      else{
        await _repository.updateProduct(detailResult);
      }
    }
  }
}
final productDetailBloc = ProductDetailBloc();