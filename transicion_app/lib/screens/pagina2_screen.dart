import 'package:flutter/material.dart';

class Pagina2Screen extends StatelessWidget {
  static const String routerName = 'pagina-2';
  const Pagina2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      backgroundColor: Colors.green,
      body: const Center(
         child: Text('Pagina2Screen'),
      ),
    );
  }
}