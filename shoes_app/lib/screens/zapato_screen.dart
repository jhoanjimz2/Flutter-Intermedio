import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';

import '../widgets/widgets.dart';

class ZapatoScreen extends StatelessWidget {
  static const String routerName = 'zapato-screen';
  const ZapatoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return Scaffold(
      //body: CustomAppbar('For you'),
      body: Column(
        children: [
          const CustomAppbar('For You'),
          const SizedBox( height: 20 ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview()
                  ),
                  ZapatoDesc(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            ),
          ),
          const AgregarCarritoBoton( monto: 180.0 )
        ],
      ),
    );
  }
}