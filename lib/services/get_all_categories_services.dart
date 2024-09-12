import 'package:store_learn/helper/api.dart';

class AllCategoriesServices {
  Future<List> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
