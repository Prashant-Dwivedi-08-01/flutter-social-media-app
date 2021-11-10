import 'package:flutter/cupertino.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
