import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});
  static const String id = 'UpdateProductPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(child: Text('Update Product Form')),
    );
  }
}
