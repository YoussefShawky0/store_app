import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/update_form_fields.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static const String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(
              fontSize: 24,
              fontFamily: GoogleFonts.fugazOne().fontFamily,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              UpdateFormFields(
                productModel: productModel,
                onLoadingChanged: (value) {
                  setState(() {
                    isLoading = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
