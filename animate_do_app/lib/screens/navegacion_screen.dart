import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  static const String routerName = 'navegacion';
  const NavegacionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notificacions Page'),
        ),
    
        floatingActionButton: _BotonFlotante(),
    
        bottomNavigationBar: _BottomNavigation(),
    
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon( FontAwesomeIcons.bone ),
          label: 'Bones'
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children:[
              const FaIcon( FontAwesomeIcons.bell ),
              Positioned(
                right: 0.0,
                top: 0.0,
                /* child: Icon( 
                  Icons.brightness_1,
                  size: 8,
                  color: Colors.pink,
                ), */
                child: BounceInDown(
                  from: 10,
                  animate: (numero > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container(
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      child: Text('$numero', style: TextStyle( color: Colors.white, fontSize: 7 ),),
                    ),
                  ),
                ),
              ) 
            ]
          ),
          label: 'Notificacions'
        ),
        const BottomNavigationBarItem(
          icon: FaIcon( FontAwesomeIcons.dog ),
          label: 'My Dog'
        )
      ]
    );
  }

}

class _BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return FloatingActionButton(
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);
        notiModel.numero += 1;
        
        if ( notiModel.numero >= 2 ) {
          notiModel.bounceController.forward( from: 0.0 );
        }

      },
      backgroundColor: Colors.pink,
      child: const FaIcon( FontAwesomeIcons.play ),
    );
  }

}

class _NotificationModel extends ChangeNotifier {

  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero( int valor ) {
    _numero = valor;
    notifyListeners();
  }
  
  AnimationController get bounceController => _bounceController;
  set bounceController( AnimationController controller ) {
    _bounceController = controller;
  }

} 