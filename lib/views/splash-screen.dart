import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/views/HomePage.dart';
import 'package:iStock/views/detalisAvant.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    const fSec = const Duration(
      seconds: 2,
    );
    new Timer(fSec, () => _go());
  }
  /*

  _go() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
*/

  _go() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AjouterTree()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF0A12F),
      body: Center(
        child: Text(
          "iStock",
          style: GoogleFonts.lobster(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
