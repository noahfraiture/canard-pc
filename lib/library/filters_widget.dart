import 'package:flutter/material.dart';
import 'package:canardpc/magazine_class.dart';
import 'filter_class.dart';

class FilterButtons extends StatefulWidget {
  final void Function() notifyParent;

  const FilterButtons({super.key, required this.notifyParent});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  // Later, if the filter is not in this map, it will set it to false.

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (Category category in Category.values)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Filter().isSelected(category)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                ),
                onPressed: () {
                  setState(
                    () => Filter().toggle(category),
                  );
                  widget.notifyParent();
                },
                child: Text(Magazine.categoryToName[category] ?? 'error',
                    style: TextStyle(
                      color: Filter().isSelected(category)
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    )))
        ]));
  }
}
