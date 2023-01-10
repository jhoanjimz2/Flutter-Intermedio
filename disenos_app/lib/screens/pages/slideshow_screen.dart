import 'package:disenos_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/theme.dart';

class SlideshowScreen extends StatelessWidget {
  static const String routerName = 'slideShow';
  const SlideshowScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if ( MediaQuery.of(context).size.height > 500 ) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
          Expanded(child: _MiSlideshow()),
          Expanded(child: _MiSlideshow()) 
    ];

    return Scaffold(
      body: ( isLarge ) 
        ? Column( children: children )
        : Row( children: children )
    );
  }
}

class _MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final themeChanger = Provider.of<ThemeChanger>(context);
    final Color secondaryColor = themeChanger.currentTheme.colorScheme.secondary;

    return Slideshow(
      bulletPrimario: 12,
      bulletSecundario: 10,
      puntosArriba: true,
      colorPrimario:  ( themeChanger.darkTheme ) 
                      ? secondaryColor
                      : const Color(0xffFF5A7E),
      slides: [
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg')
      ],
    );
  }
}