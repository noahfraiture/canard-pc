import 'package:flutter/cupertino.dart';
import 'package:canardpc/magazine_class.dart';
import 'package:canardpc/widget/grid_widget.dart';
import 'filters_widget.dart';

class Owned extends StatefulWidget {
  const Owned({super.key, required this.onClick});
  final void Function(Magazine) onClick;

  @override
  State<Owned> createState() => _OwnedState();
}

@override
class _OwnedState extends State<Owned> {
  List<Magazine> magazines = Magazines().get();

  void _onFilterSelected() {
    // Update and rebuild the state
    setState(() {
      magazines = Magazines().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilterButtons(notifyParent: _onFilterSelected),
          ),
          MagazineGrid(magazines: magazines, onClick: widget.onClick)
        ]));
  }
}
