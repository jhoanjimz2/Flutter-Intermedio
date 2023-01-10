import 'package:disenos_app/screens/screens.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = const SlideshowScreen();

  Widget get currentPage => _currentPage;

  set currentPage( Widget widget ) {
    _currentPage = widget;
    notifyListeners();
  }

}