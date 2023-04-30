import 'package:flutter/material.dart';
import 'font.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'magazine.dart';

class Category extends StatelessWidget {
  final String title;
  final List<Magazine> children;

  Category({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row title with a button on the right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getPrimaryTextStyle(context),
              ),
              // Button "see more"
              Container(
                // size of the button
                height: 35,
                width: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                margin: const EdgeInsets.only(right: 10, bottom: 10),
                child: TextButton(
                  onPressed: () {
                    // do something
                  },
                  child: Text(
                    'Voir plus',
                    style: getSecondaryTextStyle(context)
                  ),
                ),
              ),
            ],
          ),
          // Row with a horizontal scrollable list of items
          Container(
            margin: const EdgeInsets.only(left: 15, top: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (Magazine mag in children)
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "id : ${mag.id}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset(
                          mag.image,
                          height: 155,
                          width: 116,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
