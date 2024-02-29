import 'package:flutter/cupertino.dart';
import 'package:canardpc/widget/grid_widget.dart';
import '../magazine.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key, required this.category, required this.onBack, required this.onClick});
  final Category category;
  final VoidCallback onBack;
  final void Function(Magazine) onClick;

  @override
  SeeMoreState createState() => SeeMoreState();
}

@override
class SeeMoreState extends State<SeeMore> {
  List<Magazine> magazines = Magazines().get();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) => widget.onBack(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(Magazine.categoryToName[widget.category] ?? 'error'),
            ),
            MagazineGrid(magazines: magazines, onClick: widget.onClick)
          ])),
    );
  }
}
