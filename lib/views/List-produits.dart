import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/widgets/allView/status-bar.dart';
import 'package:iStock/widgets/allView/top-bar.dart';

class ALL extends StatefulWidget {
  ALL({Key key}) : super(key: key);

  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> {
  List<Produit> _produits = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  _fetchProducts() async {
    List<Produit> productList = await DatabaseProvider.db.getProduits();
    setState(() {
      _produits = productList;
    });
  }

  _all(double allSize, int qte, int seuil) {
    double x2 = (((qte * 100) / seuil) * allSize) / 100;
    return x2;
  }

  _cal(int qte, int seuil) {
    double res = (qte * 100) / seuil;
    if (res > 100) {
      return Colors.green;
    } else {
      if (res <= 100 && res >= 70) {
        return Colors.green;
      } else {
        if (res < 70 && res >= 40) {
          return Colors.orangeAccent;
        } else {
          if (res < 40) {
            return Colors.red;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BackBar(),
            StatusBar(),
            _produits.length == 0
                ? Expanded(
                    child: Center(
                      child: Text(
                        "Pas de produits !\nEssayer d'ajouter.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      child: ListView.builder(
                        itemCount: _produits.length,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 15),
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .14,
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .17,
                                  height:
                                      MediaQuery.of(context).size.width * .17,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(20),
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
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .55,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .008,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          Container(
                                            width: _all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .55,
                                                _produits[index].qte,
                                                _produits[index].seuil),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .008,
                                            decoration: BoxDecoration(
                                              color: _cal(_produits[index].qte,
                                                  _produits[index].seuil),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          )
                                        ],
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
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .11,
                                  height:
                                      MediaQuery.of(context).size.width * .11,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.white,
                                    onPressed: () {},
                                    child: Icon(
                                      FontAwesomeIcons.pen,
                                      color: Color(0XFF2163CB),
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
