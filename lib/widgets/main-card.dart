import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 30, left: 25, right: 25),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                //color: Color(0XFF32CD32),
                gradient: LinearGradient(colors: [
                  Color(0XFF36D459),
                  Color(0XFF0BC53C),
                ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
            ),
            Positioned(
              left: -25,
              bottom: -20,
              child: Opacity(
                opacity: .3,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: -40,
              child: Opacity(
                opacity: .4,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              child: Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: 60,
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Très Bien!",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "0",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Alertes des\nproduits",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Vérifier list produits",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.longArrowAltRight,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
