import 'dart:convert';

import 'package:http/http.dart' as http;
class AllCategoriesServices{

  Future<List> getAllCategories() async{
    http.Response response =
    await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    // لما بعمل decode بيرجعلي الليست اللي فيها الداتا
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}