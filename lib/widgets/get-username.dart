import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetName extends StatefulWidget {
  GetName({Key key}) : super(key: key);

  @override
  _GetNameState createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .15,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Hi,",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Houssam",
                    style: GoogleFonts.lato(
                      color: Color(0XFF2163CB),
                      fontWeight: FontWeight.w700,
                      fontSize: 27,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "Voici la liste des produits a suivre",
                style: GoogleFonts.lato(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
