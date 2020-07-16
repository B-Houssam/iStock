import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/views/modify-product.dart';
//import 'package:iStock/widgets/allView/status-bar.dart';
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
    return (((qte * 100) / seuil) * allSize) / 100;
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
                          color: Colors.red[200],
                        ),
                      ),
                      Text(
                        " : Classe A",
                      )
                    ],
                  ),
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
                        " : Classe B",
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                        ),
                      ),
                      Text(
                        " : Classe C",
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
                                EdgeInsets.only(top: 10, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _produits[index].ref.substring(0, 2),
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
                                      _produits[index].ref,
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Seuil: " + "XX",
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
                                    onPressed: () {
                                      //go to modify
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                            builder: (context) => new Modify(),
                                          ));
                                    },
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
