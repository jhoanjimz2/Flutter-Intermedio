import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme.dart';

class SliderListScreen extends StatelessWidget {
  static const String routerName = 'sliderlist';
  const SliderListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ]
      )
    );
  }
}


class _BotonNewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final themeChanger = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      child: SizedBox(
        width: size.width * 0.9,
        height: 100,
        child: ElevatedButton( // foreground
          onPressed: () { },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              (themeChanger.darkTheme) 
              ? themeChanger.currentTheme.colorScheme.secondary  
              : const Color(0xffED6762)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only( topLeft: Radius.circular(50) )
              )
            ),
          ),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
              color: themeChanger.currentTheme.scaffoldBackgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3
            ),
          )
        ),
      )
    );
  }

}


class _MainScroll extends StatelessWidget {
  
  final items = const [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
       slivers: [
        /* const SliverAppBar(
          floating: true,
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text('hola mundo')
        ), */
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegte( 
            170, 
            200, 
            Container(
              alignment: Alignment.centerLeft,
              color: themeChanger.scaffoldBackgroundColor,
              child: _Titulo()
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100)
          ])
        )
       ],
    );
  }

}

class _SliverCustomHeaderDelegte extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegte(this.minheight, this.maxheight, this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return  maxheight != oldDelegate.maxExtent ||
            minheight != oldDelegate.minExtent ||
            child     != oldDelegate.snapConfiguration;
  }

}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox( height: 30 ),
        Container(
          margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
          child: Text(
            'New', 
            style: TextStyle( 
              color: ( themeChanger.darkTheme ) 
                ? Colors.grey 
                : const Color(0xff532128), 
              fontSize: 50 
            )
          ),
        ),
        Stack(
          children: [
            const SizedBox( width: 100 ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: ( themeChanger.darkTheme ) 
                  ? Colors.grey 
                  : const Color(0xffF7CDD5), 
              ),
            ),
            Container(
              child: const Text(
                'List', 
                style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ],
        )
      ],
    );
  }

}

class _ListaTareas extends StatelessWidget {
  
  final items = const [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index] 
    );
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem(this.titulo,  this.color);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      height: 130,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ( themeChanger.darkTheme ) ? Colors.grey : color,
        borderRadius: BorderRadius.circular( 30 )
      ),
      child: Text(
        titulo, 
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
}