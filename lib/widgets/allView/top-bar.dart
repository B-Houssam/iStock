import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/views/HomePage.dart';

class BackBar extends StatefulWidget {
  BackBar({Key key}) : super(key: key);

  @override
  _BackBarState createState() => _BackBarState();
}

class _BackBarState extends State<BackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .13,
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .13,
                height: MediaQuery.of(context).size.width * .13,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new HomePage()),
                            (Route<dynamic> route) => false)
                        .then((value) => setState(() {}));
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Color(0XFF2163CB),
                    size: 20,
                  ),
                ),
              ),
              Text(
                "Produits",
                style: GoogleFonts.lato(
                  color: Color(0XFF2163CB),
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              )
            ]),
      ),
    );
  }
}
