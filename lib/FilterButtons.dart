import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final void Function(Set<String>) onFiltersSelected;

  const FilterButtons({Key? key, required this.onFiltersSelected}) : super(key: key);

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  Set<String> _selectedFilters = {'All'};

  final List<String> _filters = ['Canard PC', 'Hardware', 'Hors série', 'Hardware Hors série'];
  final List<String> _filtersId = ['CP', 'HW', 'SP', 'HS'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < _filters.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedFilters.contains(_filtersId[i]) ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                ),
                onPressed: () {
                  setState(() {
                    if (_selectedFilters.contains(_filtersId[i])) {
                      _selectedFilters.remove(_filtersId[i]);
                      if (_selectedFilters.isEmpty) _selectedFilters.add('All');
                    } else {
                      _selectedFilters.add(_filtersId[i]);
                      if (_selectedFilters.contains('All')) _selectedFilters.remove('All');
                    }
                  });
                  widget.onFiltersSelected(_selectedFilters);
                },
                child: Text(
                  _filters[i],
                  style: TextStyle(
                    color: _selectedFilters.contains(_filtersId[i]) ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
