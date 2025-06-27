import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    dynamic response = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'image': image,
        'category': category,
      },
    );

    // Handle different response types
    if (response is Map<String, dynamic>) {
      // If API returns the updated product data
      return ProductModel.fromJson(response);
    } else {
      // If API returns null or other type (common for update operations)
      // Return a ProductModel with the data we sent
      return ProductModel.fromJson({
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      });
    }
  }
}
