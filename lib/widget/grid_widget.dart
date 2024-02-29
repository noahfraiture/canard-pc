import 'package:flutter/cupertino.dart';

import '../magazine.dart';

typedef ClickCallBack<T> = void Function(T);

class MagazineGrid extends StatelessWidget {
  final List<Magazine> magazines;
  final ClickCallBack<Magazine> onClick;

  const MagazineGrid({
    super.key,
    required this.magazines,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, // adjust as needed
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.41, // A4 ratio
        ),
        itemCount: magazines.length,
        itemBuilder: (context, index) {
          final magazine = magazines[index];
          return GestureDetector(
              onTap: () => onClick(magazine),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(magazine.image),
                        fit: BoxFit.cover,
                      ))));
        });
  }
}
