import 'package:rxdart/rxdart.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/repository/repository.dart';

class CartBloc{
  final Repository _repository = Repository();

  final _fetCart = PublishSubject<List<DetailResult>>();

  Stream<List<DetailResult>> get getCard => _fetCart.stream;

  allCart() async {
    List<DetailResult> dataCart = await _repository.getProductCart();
    _fetCart.sink.add(dataCart);
  }
  updateCart(DetailResult productsModel, bool remove) async {
    if (remove) {
      if (productsModel.count == 0) {

      } else {
        await _repository.updateProduct(productsModel);
      }
    } else {
      productsModel.count;
      if (productsModel.count == 1) {
        await _repository.saveProductCard(productsModel);
      } else {
        await _repository.updateProduct(productsModel);
      }
    }
    allCart();
  }
  deleteProductCard(int id) async {
    int k = await _repository.deleteProductCard(id);
    if (k > 0) {
      allCart();
    }
  }
}
final cartBloc = CartBloc();