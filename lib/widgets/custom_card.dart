import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 190,
          height: 190,
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
                    'New Trend',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: GoogleFonts.fugazOne().fontFamily,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '22 \$',
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
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}