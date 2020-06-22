import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:url_launcher/url_launcher.dart';

class Draw extends StatefulWidget {
  Draw({Key key}) : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  height: MediaQuery.of(context).size.height * .31,
                  decoration: BoxDecoration(
                    color: Color(0XFFF0A12F),
                  ),
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    "iStock",
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                //launch('https://www.github.com/B-Houssam');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            )),
                        Text(
                          'Click here and\nvisit me on GitHub',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.link,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
