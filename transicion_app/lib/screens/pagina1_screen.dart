import 'package:flutter/material.dart';
import 'package:transicion_app/screens/screens.dart';

class Pagina1Screen extends StatelessWidget {
  static const String routerName = 'pagina-1';
  const Pagina1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: const Center(
         child: Text('Pagina1Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.access_time ),
        onPressed: () {
          Navigator.push(context, _creaRuta());
        }
      ),
    );
  }
  
  Route _creaRuta() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Pagina2Screen(),
      transitionDuration: const Duration(seconds: 2),
      transitionsBuilder: ( context, animation, secondaryAnimation, child ) {

        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);

        /* return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0), 
            end: Offset.zero
          ).animate(curvedAnimation),
          child: child,
        ); */

        /* return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        ); */

        /* return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        ); */

        /* return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        ); */

        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );

      }
    );
  }
}