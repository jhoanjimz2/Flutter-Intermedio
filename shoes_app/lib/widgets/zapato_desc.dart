import 'package:flutter/material.dart';

class ZapatoDesc extends StatelessWidget {

  final String titulo;
  final String descripcion;

  const ZapatoDesc({super.key, required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox( height: 20 ),
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox( height: 20 ),
          Text(
            descripcion,
            style: const TextStyle(
              height: 1.6,
              color: Colors.black54
            ),
          )
        ],
      ),
    );
  }

}