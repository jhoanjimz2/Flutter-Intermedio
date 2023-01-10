import 'package:flutter/material.dart';

class AudioPlayerProvider with ChangeNotifier {

  bool _playing = false;
  bool get playing => _playing;
  set playing(bool valor) {
    _playing = valor;
    notifyListeners();
  }


  Duration _songDuration = Duration( milliseconds: 0 );
  Duration get songDuration => _songDuration;
  set songDuration(Duration valor) {
    _songDuration = valor;
  }


  Duration _current      = Duration( milliseconds: 0 );
  Duration get current => _current;
  set current(Duration valor) {
    _current = valor;
  }


  late AnimationController _controller;
  AnimationController get controller => _controller;
  set controller( AnimationController valor ) {
    _controller = valor;
  }


  double get porcentaje => (_songDuration.inSeconds > 0) 
    ? _current.inSeconds / _songDuration.inSeconds
    : 0;
  

  String printDuration( Duration duration ) {

    String twoDigits(int n) {
      if ( n >= 10 ) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));    
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';

  }

  String get sonTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

}