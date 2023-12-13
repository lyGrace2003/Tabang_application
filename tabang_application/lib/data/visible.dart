import 'package:flutter/material.dart';

class VisibilityProvider extends ChangeNotifier {
  Map<String, bool> _containerVisibility = {'container1': false, 'container2': true, 'container3': true, "container4":false, 'container5':false};

  bool getContainerVisibility(String containerKey) {
    return _containerVisibility[containerKey] ?? false;
  }

  void toggleContainerVisibility(String containerKey) {
    if (_containerVisibility.containsKey(containerKey)) {
      _containerVisibility[containerKey] = !_containerVisibility[containerKey]!;
      notifyListeners();
    }
  }
}