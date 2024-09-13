class ProductModel {
  final num id; // استخدام num بدلاً من dynamic
  final String title;
  final num price; // استخدام num بدلاً من dynamic
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num), // تأكد من أن id هو num
      title: json['title'],
      price: (json['price'] as num), // تأكد من أن السعر هو num
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(), // تحويل النوع num إلى double
      count: (json['count'] as int),
    );
  }
}
