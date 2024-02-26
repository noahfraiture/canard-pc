import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'filter.dart';
import 'font.dart';
import 'magazine.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(top: 10), children: const [
      ShopCategory(title: "Canard PC", children: Magazines.canardPC),
      ShopCategory(title: "Hardware", children: Magazines.hardware),
      ShopCategory(title: "Hors-série", children: Magazines.hs),
      ShopCategory(title: "Hardware spécial", children: Magazines.hsHardware)
    ]);
  }
}

class ShopCategory extends StatelessWidget {
  final String title;
  final List<Magazine> children;

  const ShopCategory({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row title with a button on the right
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: getPrimaryTextStyle(context),
                ),
                // Button "see more"
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // do something
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Voir tout',
                      style: smallButtonTextStyle(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Row with a horizontal scrollable list of items
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    for (Magazine mag in children)
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        // we don't add padding to the right, but we'll add after the last item
                        child: GestureDetector(
                          onTap: () => Fluttertoast.showToast(msg: mag.id),
                          child: Image.asset(
                            mag.image,
                            height: 155,
                            width: 116,
                          ),
                        ),
                      ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
