import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';


class SlideShowScreen extends StatelessWidget {
  
  const SlideShowScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => SliderModel(),
      child: Scaffold(
        body: Center(
           child: Column(
             children: [ 
               Expanded(child: _Slides()),
               _Dots()
             ],
           ),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors 
class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      //print('Pagina actual: ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: const [
          _Slide('assets/slide-1.svg'),
          _Slide('assets/slide-2.svg'),
          _Slide('assets/slide-3.svg'),
        ],
      ),
    );
  }
}


// ignore: use_key_in_widget_constructors
class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(0),
          _Dot(1),
          _Dot(2)
        ],
      ),
    );
  }

}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot( this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration( milliseconds: 200 ),
      width: 12,
      height: 12 ,
      margin: const EdgeInsets.symmetric( horizontal: 5 ),
      decoration: BoxDecoration(
        color: ( pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5 ) 
          ? Colors.blue 
          : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}