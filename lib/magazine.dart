import 'library/filter.dart';

enum Category {
  canardPC,
  hardware,
  hsPC,
  hsHardware,
}

class Magazine {
  final String image;
  final String id;
  final Category category;
  bool downloaded;
  final bool bought;
  final List<String> pages = const [];

  Magazine(
      {required this.image,
      required this.id,
      required this.category,
      required this.downloaded,
      required this.bought});

  static Map<Category, String> categoryToName = {
    Category.canardPC: "Canard PC",
    Category.hardware: "Hardware",
    Category.hsPC: "Hors-serie",
    Category.hsHardware: "Hardware Hors-serie",
  };
}

class Magazines {
  static final Magazines _singleton = Magazines._internal();
  Magazines._internal();
  factory Magazines() {
    return _singleton;
  }

  static List<Magazine> canardPC = [
    Magazine(
        image: "assets/images/mai.jpg",
        id: "mai",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/avril.jpg",
        id: "avril",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/mars.jpg",
        id: "mars",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/fevrier.jpg",
        id: "fevrier",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/janvier.jpg",
        id: "janvier",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/decembre.jpg",
        id: "decembre",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/novembre.jpg",
        id: "novembre",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/mai.jpg",
        id: "CP mai",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/mars.jpg",
        id: "CP mars",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/novembre.jpg",
        id: "novembre",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/janvier.jpg",
        id: "Canard PC janvier",
        category: Category.canardPC,
        downloaded: false,
        bought: true),
  ];

  static List<Magazine> hardware = [
    Magazine(
        image: "assets/images/hardware-1.jpg",
        id: "hard1",
        category: Category.hardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/hardware-2.jpg",
        id: "hard2",
        category: Category.hardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/hardware-3.jpg",
        id: "hard3",
        category: Category.hardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/hardware-4.jpg",
        id: "hard4",
        category: Category.hardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/hardware-5.jpg",
        id: "hard5",
        category: Category.hardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/decembre.jpg",
        id: "HW decembre",
        category: Category.hardware,
        downloaded: false,
        bought: true),
  ];

  static List<Magazine> hs = [
    Magazine(
        image: "assets/images/special-1.jpg",
        id: "spec1",
        category: Category.hsPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/special-2.jpg",
        id: "spec2",
        category: Category.hsPC,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/fevrier.jpg",
        id: "HS fevrier",
        category: Category.hsPC,
        downloaded: false,
        bought: true),
  ];

  static List<Magazine> hsHardware = [
    Magazine(
        image: "assets/images/hsHardware-1.jpg",
        id: "hard-spec1",
        category: Category.hsHardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/hsHardware-2.jpg",
        id: "hard-spec2",
        category: Category.hsHardware,
        downloaded: false,
        bought: true),
    Magazine(
        image: "assets/images/avril.jpg",
        id: "SP avril",
        category: Category.hsHardware,
        downloaded: false,
        bought: true),
  ];

  List<Magazine> getByCategory(Category category) {
    switch (category) {
      case Category.canardPC:
        return canardPC;
      case Category.hardware:
        return hardware;
      case Category.hsPC:
        return hs;
      case Category.hsHardware:
        return hsHardware;
    }
  }

  List<Magazine> get() {
    List<Magazine> magazines = canardPC + hardware + hs + hsHardware;
    if (Filter().allSelected()) return magazines;
    return magazines.where((element) => Filter().isSelected(element.category)).toList();
  }
}
