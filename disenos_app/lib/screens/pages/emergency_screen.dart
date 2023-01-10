import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyScreen extends StatelessWidget {
  static const String routerName = 'emergency';

  const EmergencyScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if ( MediaQuery.of(context).size.height > 550 ) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map((item) => 
      FadeInLeft(
        duration: const Duration( milliseconds: 250 ),
        child: BotonGordo(
          texto: item.texto,
          onPress:() {print(item.texto);},
          color1: item.color1,
          color2: item.color2,
          icon: item.icon,
        ),
      )
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only( top: (isLarge) ? 220 : 10 ),
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if ( isLarge ) const SizedBox( height: 80 ),
                  ...itemMap,
                ],
              ),
            ),
          ),
          if ( isLarge ) const Encabezado()
        ]
      ),
    );
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'Asistencia Médica', 
          subtitulo: 'Haz solicitado',
          color1: Color(0xff66A9F2),
          color2: Color(0xff536CF6)
        ),
        Positioned(
          top: 45,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          )
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      onPress: () { print('click'); }, 
      texto: 'Motor accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      icon: FontAwesomeIcons.carBurst
    );
  }
}

class _PageHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plug,
      titulo: 'Has solicitado',
      subtitulo: 'Asistencia Médica',
      color1: Color(0xff536CF6),
      color2: Color(0xff66A9F2)
    );
  }
}