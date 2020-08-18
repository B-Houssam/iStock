import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produitf.dart';
import 'package:iStock/widgets/allView/top-bar.dart';

class ALL extends StatefulWidget {
  ALL({Key key}) : super(key: key);

  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> {
  List<Produitf> _produits = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  _fetchProducts() async {
    List<Produitf> productList = await DatabaseProvider.db.getProduitsF();
    setState(() {
      _produits = productList;
    });
  }

/*
  _all(double allSize, int qte, int seuil) {
    return (((qte * 100) / seuil) * allSize) / 100;
  }
  
*/
  _cal(int qte, int seuil) {
    if (qte > seuil) {
      return Colors.green;
    } else {
      if (qte == seuil) {
        return Colors.orangeAccent;
      } else {
        if (qte < seuil) {
          return Colors.redAccent;
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                        ),
                      ),
                      Text(
                        " : Bien",
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                        ),
                      ),
                      Text(
                        " : Passez commande",
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                        ),
                      ),
                      Text(
                        " : Danger",
                      )
                    ],
                  )
                ],
              ),
            ),
            //StatusBar(),
            _produits.length == 0
                ? Expanded(
                    child: Center(
                      child: Text(
                        "Pas d'articles !\nEssayer d'ajouter.",
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
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey[400],
                          );
                        },
                        itemCount: _produits.length,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 15),
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .24,
                            padding:
                                EdgeInsets.only(top: 10, left: 30, right: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                    color: _cal(_produits[index].qq,
                                        _produits[index].stockAl),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _produits[index]
                                        .ref
                                        .substring(0, 2)
                                        .toString(),
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _produits[index].ref.toString(),
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
                                      "Stock Actuel: " +
                                          _produits[index]
                                              .qq
                                              .toStringAsFixed(1),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Qte économique: " +
                                          _produits[index]
                                              .qe
                                              .toStringAsFixed(3),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Cadence: " +
                                          _produits[index]
                                              .cadence
                                              .toStringAsFixed(3),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Stock de sécurité " +
                                          _produits[index]
                                              .stockSec
                                              .toStringAsFixed(1),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Stock d'alert: " +
                                          _produits[index]
                                              .stockAl
                                              .toStringAsFixed(1),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Stock minimal: " +
                                          _produits[index]
                                              .stockmin
                                              .toStringAsFixed(1),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Point de commande: " +
                                          _produits[index]
                                              .ptc
                                              .toStringAsFixed(3),
                                      style: GoogleFonts.lato(
                                        color: Color(0XFF2163CB),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                /*
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
                                    onPressed: () {
                                      /*
                                      //go to modify
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                            builder: (context) => new Modify(),
                                          ));
                                          */
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.pen,
                                      color: Color(0XFF2163CB),
                                      size: 18,
                                    ),
                                  ),
                                ),
                                */
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
