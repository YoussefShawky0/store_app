class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'] is String
          ? double.tryParse(json['price']) ?? 0.0
          : (json['price'] as num).toDouble(),
      description: json['description'],
      imageUrl: json['image'],
      category: json['category'],
      rating: json['rating'] != null
          ? RatingModel.fromJson(json['rating'])
          : RatingModel(rate: 0.0, count: 0),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'] is String
          ? double.tryParse(json['rate']) ?? 0.0
          : (json['rate'] as num).toDouble(),
      count: json['count'] ?? 0,
    );
  }
}
