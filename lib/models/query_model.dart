import 'dart:collection';
import 'package:flutter/cupertino.dart';

class QueryModel extends ChangeNotifier {
  String _objA = '';
  String _objB = '';
  final List<String> _aspects = [];

  String get objA => _objA;
  String get objB => _objB;

  set objA(String obj) {
    assert(obj != null);
    _objA = obj;
    notifyListeners();
  }

  set objB(String obj) {
    assert(obj != null);
    _objB = obj;
    notifyListeners();
  }

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