import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/models/produitf.dart';
import 'package:iStock/models/produitv.dart';
import 'package:iStock/views/HomePage.dart';

import 'dart:math';

import 'package:iStock/views/List-produits.dart';

class Entrees extends StatefulWidget {
  final List<Produit> nb;
  Entrees({Key key, @required this.nb}) : super(key: key);

  @override
  _EntreesState createState() => _EntreesState();
}

class _EntreesState extends State<Entrees> {
  final keys = List<GlobalKey<FormState>>();
  final items = List<Produitv>();
  final itemsf = List<Produitf>();
  //var rng = new Random();

  @override
  void initState() {
    for (var i = 0; i < widget.nb.length; i++) {
      final key = new GlobalKey<FormState>();
      keys.add(key);
      var att = new Produitv(
        ref: widget.nb[i].ref,
      );
      items.add(att);
      var atr = new Produitf(
        ref: widget.nb[i].ref,
        d: widget.nb[i].consomation,
        qq: widget.nb[i].qte,
      );
      itemsf.add(atr);
    }
    super.initState();
  }

  save(Produitf p) async {
    Produitf test;
    test = await DatabaseProvider.db.insertf(p);
    if (test != null) {
      print("f -- inserted ! : " + test.ref);
    }
  }

  calcule() {
    for (var i = 0; i < itemsf.length; i++) {
      double x = (2 * itemsf[i].d * items[i].coutPas) /
          (items[i].coutPos * items[i].nbut);
      itemsf[i].qe = sqrt(x);
      itemsf[i].cadence = itemsf[i].d / itemsf[i].qe;
      itemsf[i].stockSec = items[i].consoMoy * items[i].nbjSecu;
      itemsf[i].ptc =
          itemsf[i].stockSec + (items[i].consoMoy * items[i].delais);
      itemsf[i].stockmin = items[i].consoMoy * items[i].delais;
      itemsf[i].stockAl = itemsf[i].stockSec + itemsf[i].stockmin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //---------//
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
                        "Spécification",
                        style: GoogleFonts.lato(
                          color: Color(0XFF2163CB),
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * .13,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              calcule();
                              for (var i = 0; i < itemsf.length; i++) {
                                save(itemsf[i]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new ALL()));
                              }
                            },
                            child: Text(
                              "Terminer",
                              style: GoogleFonts.lato(
                                color: Color(0XFF2163CB),
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ]),
              ),
            ),
            //---------//
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[400],
                      );
                    },
                    itemCount: widget.nb.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 330,
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: keys[index],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                itemsf[index].ref + " :",
                                style: GoogleFonts.lato(
                                  color: Color(0XFF2163CB),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },

                                      onChanged: (val) {
                                        setState(() {
                                          items[index].coutPas = int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Cout d’acquisition',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },

                                      onChanged: (val) {
                                        setState(() {
                                          items[index].coutPos = int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Cout possession',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },

                                      onChanged: (val) {
                                        setState(() {
                                          items[index].nbut = int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Nb° unité de temps',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },

                                      onChanged: (val) {
                                        setState(() {
                                          items[index].consoMoy =
                                              int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Conso. Moyenne / jour',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },

                                      onChanged: (val) {
                                        setState(() {
                                          items[index].nbjSecu = int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Nb° jours sécurité',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Obligatoire';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          items[index].delais = int.parse(val);
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Délai réaprovisionement',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      //readOnly: !_note.state.canEdit,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
