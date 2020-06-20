import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BackBar extends StatelessWidget {
  const BackBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .12,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .13,
                height: MediaQuery.of(context).size.height,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Color(0XFF2163CB),
                    size: 25,
                  ),
                ),
              ),
              Text(
                "Produits",
                style: GoogleFonts.lato(
                  color: Color(0XFF2163CB),
                  fontWeight: FontWeight.w900,
                  fontSize: 23,
                ),
              )
            ]),
      ),
    );
  }
}
