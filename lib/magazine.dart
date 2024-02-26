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
  final List<String> pages = const [];

  const Magazine({required this.image, required this.id, required this.category});

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

  static const List<Magazine> canardPC = [
    Magazine(image: "assets/images/mai.jpg", id: "mai", category: Category.canardPC),
    Magazine(image: "assets/images/avril.jpg", id: "avril", category: Category.canardPC),
    Magazine(image: "assets/images/mars.jpg", id: "mars", category: Category.canardPC),
    Magazine(image: "assets/images/fevrier.jpg", id: "fevrier", category: Category.canardPC),
    Magazine(image: "assets/images/janvier.jpg", id: "janvier", category: Category.canardPC),
    Magazine(image: "assets/images/decembre.jpg", id: "decembre", category: Category.canardPC),
    Magazine(image: "assets/images/novembre.jpg", id: "novembre", category: Category.canardPC),
    Magazine(image: "assets/images/mai.jpg", id: "CP mai", category: Category.canardPC),
    Magazine(image: "assets/images/mars.jpg", id: "CP mars", category: Category.canardPC),
    Magazine(image: "assets/images/novembre.jpg", id: "novembre", category: Category.canardPC),
    Magazine(
        image: "assets/images/janvier.jpg", id: "Canard PC janvier", category: Category.canardPC),
  ];

  static const List<Magazine> hardware = [
    Magazine(image: "assets/images/hardware-1.jpg", id: "hard1", category: Category.hardware),
    Magazine(image: "assets/images/hardware-2.jpg", id: "hard2", category: Category.hardware),
    Magazine(image: "assets/images/hardware-3.jpg", id: "hard3", category: Category.hardware),
    Magazine(image: "assets/images/hardware-4.jpg", id: "hard4", category: Category.hardware),
    Magazine(image: "assets/images/hardware-5.jpg", id: "hard5", category: Category.hardware),
    Magazine(image: "assets/images/decembre.jpg", id: "HW decembre", category: Category.hardware),
  ];

  static const List<Magazine> hs = [
    Magazine(image: "assets/images/special-1.jpg", id: "spec1", category: Category.hsPC),
    Magazine(image: "assets/images/special-2.jpg", id: "spec2", category: Category.hsPC),
    Magazine(image: "assets/images/fevrier.jpg", id: "HS fevrier", category: Category.hsPC),
  ];

  static const List<Magazine> hsHardware = [
    Magazine(
        image: "assets/images/hsHardware-1.jpg", id: "hard-spec1", category: Category.hsHardware),
    Magazine(
        image: "assets/images/hsHardware-2.jpg", id: "hard-spec2", category: Category.hsHardware),
    Magazine(image: "assets/images/avril.jpg", id: "SP avril", category: Category.hsHardware),
  ];

  List<Magazine> get(Map<Category, bool> filter) {
    List<Magazine> magazines = canardPC + hardware + hs + hsHardware;
    return magazines.where((element) => filter[element.category] ?? true).toList();
  }
}
