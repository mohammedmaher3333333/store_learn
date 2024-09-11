import 'dart:convert';
import 'package:store_learn/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllProductsServices {
  Future<List<ProductModel>> getAllProduct() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // لما بعمل decode بيرجعلي الليست اللي فيها الداتا
    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
