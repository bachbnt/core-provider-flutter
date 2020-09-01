import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;

  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }
}
