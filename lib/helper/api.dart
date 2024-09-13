import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {};

    // إضافة التوكن إذا كان موجوداً
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // تنفيذ الطلب
    final http.Response response = await http.get(Uri.parse(url), headers: headers);

    // فحص حالة الاستجابة
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // إرجاع البيانات
    } else {
      // في حالة وجود مشكلة، إرجاع رسالة تفصيلية
      throw Exception('Error: Status code ${response.statusCode}, Body: ${response.body}');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json', // افتراضياً body يُرسل كـ JSON
    };

    // إضافة التوكن إذا كان موجوداً
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // تنفيذ الطلب
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body), // تحويل body إلى JSON
    );

    // فحص حالة الاستجابة
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // إرجاع البيانات
    } else {
      // إرجاع رسالة الخطأ
      throw Exception('Error: Status code ${response.statusCode}, Body: ${response.body}');
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json', // افتراضياً body يُرسل كـ JSON
    };

    // إضافة التوكن إذا كان موجوداً
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // تنفيذ الطلب
    final http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body), // تحويل body إلى JSON
    );

    // فحص حالة الاستجابة
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // إرجاع البيانات
    } else {
      // إرجاع رسالة الخطأ
      throw Exception('Error: Status code ${response.statusCode}, Body: ${response.body}');
    }
  }
}
