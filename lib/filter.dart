import 'magazine.dart';

class Filter {
  static final _singleton = Filter._internal();
  Filter._internal();
  factory Filter() {
    return _singleton;
  }

  final Map<Category, bool> _isFilter = {};

  // get method that return a list of filter true in _isFilter
  List<Category> getList() {
    return _isFilter.entries.where((element) => element.value).map((e) => e.key).toList();
  }

  Map<Category, bool> getMap() {
    return _isFilter;
  }

  bool allSelected() {
    int nbTrue = _isFilter.values.fold(0, (int value, element) => value + (element ? 1 : 0));
    return nbTrue == 0 || nbTrue == _isFilter.length;
  }

  bool isSelected(Category category) {
    return _isFilter[category] ?? false;
  }

  void toggle(Category category) {
    _isFilter[category] = (_isFilter[category] ?? true);
  }
}
