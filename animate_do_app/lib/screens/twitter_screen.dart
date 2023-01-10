import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  static const String routerName = 'twitter';
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {

  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const FaIcon( FontAwesomeIcons.play ),
        onPressed: () {
          setState(() => activar = true);
        },
      ),

      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activar,
          from: 30,
          duration: const Duration(milliseconds: 1000),
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}