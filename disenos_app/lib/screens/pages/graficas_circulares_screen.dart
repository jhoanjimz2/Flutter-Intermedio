import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme.dart';
import '../../widgets/widgets.dart';

class GraficasCircularesScreen extends StatefulWidget {
  static const String routerName = 'graficasCirculares';
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() => _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => setState(() {
          porcentaje += 10;
          if ( porcentaje > 100 ) {
            porcentaje = 0;
          }
        }),
        child: const Icon( Icons.refresh )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje, 
                color: Colors.yellow, 
                arrayColors: const [
                Color(0xffC012ff),
                Color(0xff6D05E8),
                Colors.yellow
                ]
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.2, 
                color: Colors.yellow, 
                arrayColors: const [
                Color(0xffC012ff),
                Color(0xff6D05E8),
                Colors.blue
                ]
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje * 1.4, 
                color: Colors.yellow, 
                arrayColors: const [
                Color(0xffC012ff),
                Color(0xff6D05E8),
                Colors.red
                ]
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.6, 
                color: Colors.yellow, 
                arrayColors: const [
                Color(0xffC012ff),
                Color(0xff6D05E8),
                Colors.indigo 
                ]
              ),
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.color,
    required this.arrayColors
  });

  final double porcentaje;
  final Color color;
  final List<Color> arrayColors;

  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context).currentTheme;

    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: Colors.grey,
        colorSecundario: themeChanger.textTheme.bodyLarge!.color!,
        grosorPrimario: 4,
        grosorSecundario: 10,
        arrayColors: arrayColors,
      ),
    );
  }
}