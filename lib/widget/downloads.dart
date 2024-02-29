import 'package:flutter/cupertino.dart';
import '../classes/magazine.dart';
import 'filter.dart';

typedef ClickCallBack<T> = void Function(T);

class Downloads extends StatefulWidget {
  const Downloads({super.key, required this.onClick});
  final ClickCallBack<Magazine> onClick;

  @override
  DownloadsState createState() => DownloadsState();
}

@override
class DownloadsState extends State<Downloads> {
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300, // NOTE : dummy value
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.41, // A4 ratio
            ),
            itemCount: magazines.length,
            itemBuilder: (context, index) {
              final magazine = magazines[index];
              return GestureDetector(
                onTap: () => {
                  widget.onClick(magazine),
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(magazine.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        ]));
  }
}
