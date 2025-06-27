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
            productName = value.trim().isEmpty ? null : value.trim();
          },
          labelText: 'Product Name',
          hintText: widget.productModel.title, // Show current value as hint
        ),
        const SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productDescription = value.trim().isEmpty ? null : value.trim();
          },
          labelText: 'Description',
          hintText: widget.productModel.description,
        ),
        const SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productPrice = value.trim().isEmpty ? null : value.trim();
          },
          labelText: 'Price',
          hintText: widget.productModel.price.toString(),
        ),
        const SizedBox(height: 16.0),
        CustomFormTextField(
          onChanged: (value) {
            productImageUrl = value.trim().isEmpty ? null : value.trim();
          },
          labelText: 'Image URL',
          hintText: widget.productModel.imageUrl,
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
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Update failed: $e')));
            } finally {
              widget.onLoadingChanged(false);
            }
          },
        ),
      ],
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
      id: widget.productModel.id,
      title: productName ?? widget.productModel.title,
      price: productPrice != null
          ? double.tryParse(productPrice!) ?? widget.productModel.price
          : widget.productModel.price,
      description: productDescription ?? widget.productModel.description,
      image: productImageUrl ?? widget.productModel.imageUrl,
      category: widget.productModel.category,
    );
  }
}
