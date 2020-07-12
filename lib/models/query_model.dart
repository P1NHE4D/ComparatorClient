import 'dart:collection';
import 'package:flutter/cupertino.dart';

class QueryModel extends ChangeNotifier {
  String _objA = '';
  String _objB = '';
  bool _quickSearch = true;
  bool _resetOnSubmit = true;
  bool _enableFiltering = false;
  final Map<String, bool> _aspects = {};

  String get objA => _objA;

  String get objB => _objB;

  bool get quickSearch => _quickSearch;

  set quickSearch(bool val) {
    assert(val != null);
    _quickSearch = val;
    notifyListeners();
  }

  bool get autoReset => _resetOnSubmit;

  set autoReset(bool val) {
    assert(val != null);
    _resetOnSubmit = val;
    notifyListeners();
  }

  bool get enableFilter => _enableFiltering;

  set enableFilter(bool val) {
    assert(val != null);
    _enableFiltering = val;
    notifyListeners();
  }

  void setObjects(String objA, String objB) {
    assert(objA != null);
    assert(objB != null);
    _objA = objA;
    _objB = objB;
    notifyListeners();
  }

  UnmodifiableMapView<String, bool> get aspects =>
      UnmodifiableMapView(_aspects);

  void addAspect(String aspect) {
    setAspectFilter(aspect, true);
  }

  void setAspectFilter(String aspect, bool filter) {
    assert(aspect != null);
    assert(filter != null);
    _aspects[aspect] = filter;
    notifyListeners();
  }

  void removeAspect(String aspect) {
    if (aspect == null) return;
    _aspects.remove(aspect);
    notifyListeners();
  }

  void resetModel() {
    _aspects.clear();
    _objA = '';
    _objB = '';
    _quickSearch = true;
    notifyListeners();
  }
}
