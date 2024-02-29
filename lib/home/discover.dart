import 'package:flutter/material.dart';
import '../magazine.dart';
import '../resources/font.dart';

class Discover extends StatefulWidget {
  const Discover({super.key, required this.onClickMagazine, required this.onClickCategory});
  final void Function(Magazine) onClickMagazine;
  final void Function(Category) onClickCategory;

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(top: 10), children: [
      for (final category in Category.values)
        Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(
                      Magazine.categoryToName[category] ?? 'error',
                      style: getPrimaryTextStyle(context),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextButton(
                            onPressed: () => widget.onClickCategory(category),
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              'See more',
                              style: smallButtonTextStyle(context),
                            )))
                  ])),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(children: [
                        for (Magazine magazine in Magazines().getByCategory(category))
                          Container(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                  onTap: () => widget.onClickMagazine(magazine),
                                  child: Image.asset(
                                    magazine.image,
                                    height: 155,
                                    width: 116,
                                  )))
                      ])))
            ]))
    ]);
  }
}
