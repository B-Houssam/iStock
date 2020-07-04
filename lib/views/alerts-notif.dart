import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/widgets/alertsView/top-bar.dart';
import 'package:iStock/widgets/allView/status-bar.dart';

class Alerts extends StatefulWidget {
  Alerts({Key key}) : super(key: key);

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  int _count = 0;
  List<Produit> _produits = [];

/*
  _fetchAlerts() async {
    List<Produit> productList = await DatabaseProvider.db.getProduits();
    productList.forEach((element) {
      if (element.qte < element.seuil) {
        setState(() {
          _produits.add(element);
          _count = _produits.length;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchAlerts();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE9E9F9),
      /*
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar2(),
            StatusBar(),
            /*
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(25),
              child: Text(
                "Vous avez " + _count.toString() + " Alerts de produits",
                style: GoogleFonts.lato(
                  color: Color(0XFF2163CB),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            */
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: _produits.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .1,
                        //padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * .16,
                              height: MediaQuery.of(context).size.width * .16,
                              decoration: BoxDecoration(
                                color: Color(0XFFED213A),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _produits[index].nom.substring(0, 2),
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _produits[index].nom,
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 21,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _produits[index].qte.toString() +
                                      " item dans le stock",
                                  style: GoogleFonts.lato(
                                    color: Color(0XFF2163CB),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
      */
    );
  }
}
