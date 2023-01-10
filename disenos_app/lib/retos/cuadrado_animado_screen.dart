import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  static const String routerName = 'cuadradoAnimado';
  const CuadradoAnimadoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this, 
      duration: const Duration( milliseconds: 4500 )
    );

    moverDerecha = Tween( begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval( 0.0, 0.25, curve: Curves.bounceOut ))
    );

    moverArriba = Tween( begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval( 0.25, 0.50, curve: Curves.bounceOut ))
    );

    moverIzquierda = Tween( begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval( 0.50, 0.75, curve: Curves.bounceOut ))
    );

    moverAbajo = Tween( begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval( 0.75, 1.0, curve: Curves.bounceOut ))
    );

    controller.addListener(() { 

      if ( controller.status == AnimationStatus.completed ) {
        controller.reset();
      }

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangulo(),
      builder: ( context, childRectangulo ) {
        return Transform.translate(
          offset: Offset( moverDerecha.value + moverIzquierda.value, moverAbajo.value + moverArriba.value ),
          child: childRectangulo,
        );
      }
    );
  }
}


class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}