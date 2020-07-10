import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';

import 'HomePage.dart';

class AjouterFive extends StatefulWidget {
  final int a;
  final int b;

  AjouterFive({Key key, this.a, this.b}) : super(key: key);

  @override
  _AjouterFiveState createState() => _AjouterFiveState();
}

class _AjouterFiveState extends State<AjouterFive> {
  List<Produit> _produitsOrdC = [];
  List<Produit> _produitsOrdCs = [];
  List<int> cumule = [];
  List<int> cumuleC = [];
  int coutTotal = 0;
  int consTotal = 0;

  _getTotalC() {
    for (var i = 0; i < _produitsOrdC.length; i++) {
      coutTotal = coutTotal + _produitsOrdC[i].cout;
    }
  }

  _getTotalCons() {
    for (var i = 0; i < _produitsOrdCs.length; i++) {
      consTotal = consTotal + _produitsOrdCs[i].consomation;
    }
  }

  _getCumulesC() {
    for (var i = 0; i < _produitsOrdC.length; i++) {
      if (i == 0) {
        cumuleC
            .add(((_produitsOrdCs[i].consomation) * 100 / consTotal).round());
      } else {
        cumuleC.add(
            ((_produitsOrdCs[i].consomation) * 100 / consTotal).round() +
                cumuleC[i - 1]);
      }
    }
  }

  _getCumules() {
    for (var i = 0; i < _produitsOrdC.length; i++) {
      if (i == 0) {
        cumule.add(((_produitsOrdC[i].cout) * 100 / coutTotal).round());
      } else {
        cumule.add(((_produitsOrdC[i].cout) * 100 / coutTotal).round() +
            cumule[i - 1]);
      }
    }
  }

  _fetchConso() async {
    List<Produit> productListC =
        await DatabaseProvider.db.getProduitsOrdreCons();
    setState(() {
      _produitsOrdCs = productListC;
    });
    _getTotalCons();
    _getCumulesC();
  }

  _fetchProducts() async {
    List<Produit> productList = await DatabaseProvider.db.getProduitsOrdre();

    setState(() {
      _produitsOrdC = productList;
    });

    _getTotalC();
    _getCumules();
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _fetchConso();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
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
                            FontAwesomeIcons.times,
                            color: Color(0XFF2163CB),
                            size: 20,
                          ),
                        ),
                      ),
                      Text(
                        "Classification",
                        style: GoogleFonts.lato(
                            color: Color(0XFF2163CB),
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * .13,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              "Suivant",
                              style: GoogleFonts.lato(
                                color: Color(0XFF2163CB),
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ]),
              ),
            ),
            ////////
            ///
            ///
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: _produitsOrdC.length == 0 ||
                            _produitsOrdCs.length == 0
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey[300],
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0XFF2163CB)),
                            ),
                          )
                        : ListView(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Cout: ",
                                    style: GoogleFonts.lato(
                                      color: Color(0XFF2163CB),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "Référence",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "Cout",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "% Cumulé",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            "Classe",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF2163CB)),
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //color: Colors.grey[100],
                              height: MediaQuery.of(context).size.height * .25,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 20, top: 10),
                                physics: BouncingScrollPhysics(),
                                itemCount: _produitsOrdC.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                        EdgeInsets.only(right: 20, left: 20),
                                    color: (() {
                                      if (cumule[index] < widget.a &&
                                          cumule[index] > 0) {
                                        return Colors.red[100];
                                      } else {
                                        if (cumule[index] > widget.a &&
                                            cumule[index] < widget.b) {
                                          return Colors.green[100];
                                        } else {
                                          return Colors.blue[100];
                                        }
                                      }
                                    }()),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            _produitsOrdC[index].ref,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            _produitsOrdC[index]
                                                .cout
                                                .toString(),
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            cumule[index].toString(),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(((() {
                                              if (cumule[index] < widget.a &&
                                                  cumule[index] > 0) {
                                                return "A";
                                              } else {
                                                if (cumule[index] > widget.a &&
                                                    cumule[index] < widget.b) {
                                                  return "B";
                                                } else {
                                                  return "C";
                                                }
                                              }
                                            })())),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Consomation: ",
                                    style: GoogleFonts.lato(
                                      color: Color(0XFF2163CB),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "Référence",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "Cons",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Text(
                                          "% Cumulé",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFF2163CB)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            "Classe",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF2163CB)),
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //color: Colors.grey[100],
                              height: MediaQuery.of(context).size.height * .25,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 20, top: 10),
                                physics: BouncingScrollPhysics(),
                                itemCount: _produitsOrdCs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                        EdgeInsets.only(right: 20, left: 20),
                                    color: (() {
                                      if (cumuleC[index] < widget.a &&
                                          cumuleC[index] > 0) {
                                        return Colors.red[100];
                                      } else {
                                        if (cumuleC[index] > widget.a &&
                                            cumuleC[index] < widget.b) {
                                          return Colors.green[100];
                                        } else {
                                          return Colors.blue[100];
                                        }
                                      }
                                    }()),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            _produitsOrdCs[index].ref,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            _produitsOrdCs[index]
                                                .consomation
                                                .toString(),
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            cumuleC[index].toString(),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(((() {
                                              if (cumuleC[index] < widget.a &&
                                                  cumuleC[index] > 0) {
                                                return "A";
                                              } else {
                                                if (cumuleC[index] > widget.a &&
                                                    cumuleC[index] < widget.a) {
                                                  return "B";
                                                } else {
                                                  return "C";
                                                }
                                              }
                                            })())),
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ])))
          ],
        ),
      ),
    );
  }
}
