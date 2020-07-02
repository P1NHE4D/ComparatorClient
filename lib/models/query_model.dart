import 'dart:collection';
import 'package:flutter/cupertino.dart';

class QueryModel extends ChangeNotifier {
  String _objA = '';
  String _objB = '';
  final List<String> _aspects = [];

  String get objA => _objA;
  String get objB => _objB;

  void setObjects(String objA, String objB) {
    assert(objA != null);
    assert(objB != null);
    _objA = objA;
    _objB = objB;
    notifyListeners();
  }

  UnmodifiableListView<String> get aspects => UnmodifiableListView(_aspects);

  void addAspect(String aspect) {
    _aspects.add(aspect);
    notifyListeners();
  }

  void removeAspect(String aspect) {
    _aspects.remove(aspect);
    notifyListeners();
  }

  void resetModel() {
    _aspects.clear();
    _objA = '';
    _objB = '';
    notifyListeners();
  }
}