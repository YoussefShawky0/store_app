import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.fugazOne().fontFamily,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              // Add cart functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found.'));
            } else {
              return GridView.builder(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .95,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CustomCard(productModel: snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
