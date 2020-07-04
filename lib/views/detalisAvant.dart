import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';

import 'HomePage.dart';

class AjouterTree extends StatefulWidget {
  AjouterTree({Key key}) : super(key: key);

  @override
  _AjouterTreeState createState() => _AjouterTreeState();
}

class _AjouterTreeState extends State<AjouterTree> {
  List<Produit> _produitsOrdC = [];
  List<Produit> _produitsOrdCs = [];
  List<int> cumule = [];
  List<int> cumuleC = [];
  int coutTotal = 0;
  int qteTotal = 0;
  int consTotal = 0;
  //List<CouData> data = [];

  _fetchProducts() async {
    List<Produit> productList = await DatabaseProvider.db.getProduitsOrdre();

    setState(() {
      _produitsOrdC = productList;
    });

    _getTotalCout();
    _getCumules();
    //_buildData();
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

  _getTotalCons() {
    for (var i = 0; i < _produitsOrdCs.length; i++) {
      consTotal = consTotal + _produitsOrdCs[i].consomation;
    }
  }

/*
  _buildData() {
    for (var i = 0; i < _produitsOrdC.length; i++) {
      data.add(new CouData(
          _produitsOrdC[_produitsOrdC.length - (i + 1)].qte, cumule[i]));
    }
  }

  _getSeriesData() {
    List<charts.Series<CouData, int>> series = [
      charts.Series(
          id: "Cout",
          data: data,
          domainFn: (CouData series, _) => series.qte,
          measureFn: (CouData series, _) => series.cumul,
          colorFn: (CouData series, _) =>
              charts.MaterialPalette.blue.shadeDefault)
    ];
    return series;
  }
*/
  _getTotalCout() {
    for (var i = 0; i < _produitsOrdC.length; i++) {
      coutTotal = coutTotal + _produitsOrdC[i].cout;
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
              //////////////////////////
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: ListView(
                            children: <Widget>[
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            "Cout %",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF2163CB)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "cumulé",
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
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                      bottom: 20, left: 20, right: 20),
                                  physics: BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: Colors.grey[300],
                                    );
                                  },
                                  itemCount: _produitsOrdC.length,
                                  itemBuilder: (context, index) {
                                    return Row(
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
                                          alignment: Alignment.center,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text("" +
                                              ((_produitsOrdC[index].cout) *
                                                      100 /
                                                      coutTotal)
                                                  .round()
                                                  .toString()),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: cumule.length != 0
                                                ? Text(
                                                    cumule[index].toString(),
                                                  )
                                                : Text("-"),
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              /////////////
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text(
                                            "Conso",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF2163CB)),
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
                                            "Conso %",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF2163CB)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "cumulé",
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
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                      bottom: 20, left: 20, right: 20),
                                  physics: BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: Colors.grey[300],
                                    );
                                  },
                                  itemCount: _produitsOrdC.length,
                                  itemBuilder: (context, index) {
                                    return Row(
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
                                          alignment: Alignment.center,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40) /
                                              4,
                                          child: Text("" +
                                              ((_produitsOrdCs[index]
                                                          .consomation) *
                                                      100 /
                                                      consTotal)
                                                  .round()
                                                  .toString()),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: cumule.length != 0
                                                ? Text(
                                                    cumuleC[index].toString(),
                                                  )
                                                : Text("-"),
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ))))
            ],
          ),
        ));
  }
}

class CouData {
  final int qte;
  final int cumul;

  CouData(this.qte, this.cumul);
}
