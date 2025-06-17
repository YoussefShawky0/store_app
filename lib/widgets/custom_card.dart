import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.id,
          arguments: productModel,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 212, 212, 212),
                  blurRadius: 40.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.fugazOne().fontFamily,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${productModel.price.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.fugazOne().fontFamily,
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 40,
            child: Image.network(
              productModel.imageUrl,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
