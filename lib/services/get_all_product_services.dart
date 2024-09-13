import 'package:store_learn/helper/api.dart';
import 'package:store_learn/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<dynamic> data =
      await Api().get(url: 'https://fakestoreapi.com/products');
      print(data); // تأكد من أن البيانات متوافقة مع النموذج

      List<ProductModel> productList = [];
      for (var item in data) {
        productList.add(ProductModel.fromJson(item));
      }
      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

}
