import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/views/List-produits.dart';
import 'package:iStock/views/add-produit.dart';

class ActionB extends StatefulWidget {
  ActionB({Key key}) : super(key: key);

  @override
  _ActionState createState() => _ActionState();
}

class _ActionState extends State<ActionB> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          FractionallySizedBox(
              heightFactor: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 12.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, -3.0),
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: MediaQuery.of(context).size.height * .035,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.width * .14,
                  decoration: BoxDecoration(
                    color: Color(0XFFF0A12F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color(0XFFF0A12F),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddItem()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Ajouter transaction",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.plusCircle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .14,
                  height: MediaQuery.of(context).size.width * .14,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color(0XFFF0A12F),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ALL()));
                    },
                    child: Icon(
                      FontAwesomeIcons.list,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
