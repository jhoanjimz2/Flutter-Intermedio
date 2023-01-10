import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme.dart';
import '../../widgets/widgets.dart';

class HeadersScreen extends StatelessWidget {
  static const String routerName = 'headers';
  const HeadersScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final color = Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;

    return Scaffold(
      //body: HeaderCuadrado(),
      //body: HeaderBordesRedondeados(),
      //body: HeaderDiagonal(),
      //body: HeaderTriangular(),
      //body: HeaderPico(),
      //body: HeaderCurvo(),
      body: HeaderWave(color),
      //body: HeaderWaveGradient(),
    );
  }
}