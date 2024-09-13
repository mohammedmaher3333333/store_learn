import 'package:store_learn/helper/api.dart';
import 'package:store_learn/models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
    required dynamic id,
  }) async {
    try {
      final response = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        },
      );

      // التحقق من أن الرد ليس null
      if (response == null) {
        throw Exception('Received null response from API');
      }

      // التحقق من نوع البيانات
      if (response is! Map<String, dynamic>) {
        throw Exception('Invalid data format: Expected Map<String, dynamic> but got ${response.runtimeType}');
      }

      return ProductModel.fromJson(response);
    } catch (e) {
      print('Error updating product: $e');
      rethrow;
    }
  }
}
