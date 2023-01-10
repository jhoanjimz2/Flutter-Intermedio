import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ThemeChanger with ChangeNotifier {

  bool _darkTheme   = true;
  bool _customTheme = false;

  ThemeData _currentTheme = AppTheme.lightTheme;

  ThemeChanger( int theme ) {

    switch( theme ) {

      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = AppTheme.lightTheme;
      break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = AppTheme.darkTheme;
      break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = AppTheme.lightTheme;
      break;

      default :
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = AppTheme.lightTheme;
      break;

    }
    
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;


  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if ( value ) {
      _currentTheme = AppTheme.darkTheme;
    } else {
      _currentTheme = AppTheme.lightTheme;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if ( value ) {
      _currentTheme = AppTheme.customTheme;
    } else {
      _currentTheme = AppTheme.lightTheme;
    }

    notifyListeners();
  }

}