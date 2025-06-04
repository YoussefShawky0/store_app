import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getProductsByCategory({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductModel> productsList = [];
    for (var item in data) {
      productsList.add(ProductModel.fromJson(item));
    }
    return productsList;
  }
}
