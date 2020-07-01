import 'dart:collection';
import 'package:flutter/cupertino.dart';

class AspectListModel extends ChangeNotifier {
  final List<String> _aspects = [];

  UnmodifiableListView<String> get aspects => UnmodifiableListView(_aspects);

  void add(String aspect) {
    _aspects.add(aspect);
    notifyListeners();
  }

  void remove(String aspect) {
    _aspects.remove(aspect);
    notifyListeners();
  }

  void removeAll() {
    _aspects.clear();
    notifyListeners();
  }
}