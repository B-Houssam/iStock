import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';

class StatusBar extends StatefulWidget {
  StatusBar({Key key}) : super(key: key);

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  Color col1 = Color(0XFF36D459);
  Color col2 = Color(0XFF0BC53C);
  //col1 = Color(0XFF00F260);
  //col2 = Color(0XFF0575E6);

  int count = 0;
  String mssg = "Tout est bien";

  @override
  void initState() {
    super.initState();
    _check();
  }

  _check() async {
    List<Produit> productList = await DatabaseProvider.db.getProduits();
    productList.forEach((element) {
      if (element.qte < element.qte) {
        setState(() {
          col1 = Color(0XFFED213A);
          col2 = Color(0XFF93291E);
          count++;
          mssg = "Atention!";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .17,
      child: Padding(
        padding: EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 10),
        child: Container(
            padding: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                col1,
                col2,
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 15,
                  top: MediaQuery.of(context).size.height * .05,
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
                  child: Text(
                      mssg + "\n" + count.toString() + " alèrtes des articles!",
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
