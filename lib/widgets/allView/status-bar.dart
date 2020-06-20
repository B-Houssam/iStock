import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusBar extends StatefulWidget {
  StatusBar({Key key}) : super(key: key);

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .17,
      child: Padding(
        padding: EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 10),
        child: Container(
            //alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0XFF36D459),
                Color(0XFF0BC53C),
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 20,
                  top: 10,
                  child: Opacity(
                    opacity: .4,
                    child: Icon(
                      FontAwesomeIcons.table,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Tout est bien\n0 Alèrtes des produits!",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                )
              ],
            )),
      ),
    );
  }
}
