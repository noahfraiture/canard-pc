import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {

  final String title;

  const Category({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Wrap(
        spacing: 10,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: GoogleFonts.anybody(
                textStyle: const TextStyle(fontSize: 17),
              ),
            ),
          ),
          // Add a row with a horizontal scrollable list of items
          Container(
            color: Colors.amber, // debug color
            margin: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
