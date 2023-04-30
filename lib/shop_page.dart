import 'package:flutter/material.dart';
import 'category.dart';
import 'magazine.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView
      (
      padding: const EdgeInsets.only(top: 10),
      children: [
        Category(title: "Canard PC", children: const [
          Magazine(image: "assets/images/mai.jpg", id: "mai"),
          Magazine(image: "assets/images/avril.jpg", id: "avril"),
          Magazine(image: "assets/images/mars.jpg", id: "mars"),
          Magazine(image: "assets/images/fevrier.jpg", id: "fevrier"),
          Magazine(image: "assets/images/janvier.jpg", id: "janvier"),
          Magazine(image: "assets/images/decembre.jpg", id: "decembre"),
          Magazine(image: "assets/images/novembre.jpg", id: "novembre"),
        ]),
        Category(
          title: "Hardware",
          children: const [
            Magazine(image: "assets/images/hardware-1.jpg", id: "hard1"),
            Magazine(image: "assets/images/hardware-2.jpg", id: "hard2"),
            Magazine(image: "assets/images/hardware-3.jpg", id: "hard3"),
            Magazine(image: "assets/images/hardware-4.jpg", id: "hard4"),
            Magazine(image: "assets/images/hardware-5.jpg", id: "hard5"),
          ],
        ),
        Category(
          title: "Hors-série",
          children: const [
            Magazine(image: "assets/images/special-1.jpg", id: "spec1"),
            Magazine(image: "assets/images/special-2.jpg", id: "spec2"),
          ],
        ),
        Category(
          title: "Hardware spécial",
          children: const [
            Magazine(
                image: "assets/images/hardware-special-1.jpg",
                id: "hard-spec1"),
            Magazine(
                image: "assets/images/hardware-special-2.jpg",
                id: "hard-spec2"),
          ],
        ),
      ],
    );
  }
}

