import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_txt_field.dart';

class UpdateFormFields extends StatefulWidget {
  const UpdateFormFields({
    super.key,
    required this.productModel,
    required this.onLoadingChanged,
  });

  final ProductModel productModel;
  final ValueChanged<bool> onLoadingChanged;

  @override
  State<UpdateFormFields> createState() => _UpdateFormFieldsState();
}

class _UpdateFormFieldsState extends State<UpdateFormFields> {
  String? productName, productDescription, productImageUrl, productPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormTextField(
          onChanged: (value) {
            productName = value;
          },
          labelText: 'Product Name',
          hintText: 'Enter product name',
        ),
        SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productDescription = value;
          },
          labelText: 'Description',
          hintText: 'Enter product description',
        ),
        SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productPrice = value;
          },
          labelText: 'Price',
          hintText: 'Enter product price',
        ),
        SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productImageUrl = value;
          },
          labelText: 'Image URL',
          hintText: 'https://example.com/image.jpg',
        ),
        const SizedBox(height: 40),
        CustomButton(
          text: 'Update Product',
          onTap: () async {
            widget.onLoadingChanged(true);
            try {
              await updateProduct();
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Update failed: $e')),
              );
            }
            widget.onLoadingChanged(false);
          },
        ),
      ],
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
      id: widget.productModel.id,
      title: productName ?? widget.productModel.title,
      price: productPrice ?? widget.productModel.price.toString(),
      description: productDescription ?? widget.productModel.description,
      image: productImageUrl ?? widget.productModel.imageUrl,
      category: widget.productModel.category,
    );
  }
}
