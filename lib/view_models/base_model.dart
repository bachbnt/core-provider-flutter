import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState viewState = ViewState.Idle;

  void setState(ViewState newViewState) {
    viewState = newViewState;
    notifyListeners();
  }
}
