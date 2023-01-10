import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed, 
    required this.icon
  });
}


class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items ;

  /* final List<PinterestButton> items = [
    PinterestButton( icon: Icons.pie_chart, onPressed:  () { print('Icon pie_chart'); }),
    PinterestButton( icon: Icons.search, onPressed:  () { print('Icon search'); }),
    PinterestButton( icon: Icons.notifications, onPressed:  () { print('Icon notifications'); }),
    PinterestButton( icon: Icons.supervised_user_circle, onPressed:  () { print('Icon supervised_user_circle'); }),
  ]; */

  PinterestMenu({ 
    required this.items,
    this.mostrar = true, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black, 
    this.inactiveColor = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: mostrar ? 1 : 0,
        duration: const Duration( milliseconds: 250 ),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor   = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor   = inactiveColor;
            return _PinteresMenuBackground(child: _MenuItems( items ));
          },
        ),
      )
    );
  }
}

class _PinteresMenuBackground extends StatelessWidget {

  final Widget child;

  const _PinteresMenuBackground({ required this.child });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all( Radius.circular(100) ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])
      )
    );
  }

}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    
    final _MenuModel itemSeleccionado = Provider.of<_MenuModel>(context);
    final bool seleccionado = (itemSeleccionado.itemSeleccionado == index) ? true : false;

    return GestureDetector(
      onTap: () {
        item.onPressed();
        itemSeleccionado.itemSeleccionado = index;
      },
      behavior: HitTestBehavior.translucent,
      child: Icon( 
        item.icon,
        size: (seleccionado) ? 30 : 25,
        color: (seleccionado) ? itemSeleccionado.activeColor : itemSeleccionado.inactiveColor,
      )
    );
  }

}


class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado( int index ) {
    _itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor( Color color ) {
    _backgroundColor = color;
  }

  Color get activeColor => _activeColor;
  set activeColor( Color color ) {
    _activeColor = color;
  }

  Color get inactiveColor => _inactiveColor;
  set inactiveColor( Color color ) {
    _inactiveColor = color;
  }

}