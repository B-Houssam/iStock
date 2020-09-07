import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/views/HomePage.dart';
import 'package:iStock/views/ajouterSeuil.dart';

class AjouterOne extends StatefulWidget {
  final int nb;
  AjouterOne({Key key, this.nb}) : super(key: key);

  @override
  _AjouterOneState createState() => _AjouterOneState();
}

class _AjouterOneState extends State<AjouterOne> {
  final keys = List<GlobalKey<FormState>>();
  final items = List<Produit>();

  @override
  void initState() {
    for (var i = 0; i < widget.nb; i++) {
      final key = new GlobalKey<FormState>();
      keys.add(key);
      var art = Produit();
      items.add(art);
    }
    super.initState();
  }

  save(Produit p) async {
    Produit test;
    test = await DatabaseProvider.db.insert(p);
    if (test != null) {
      print("inserted !");
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
                        "Insertion des produits",
                        style: GoogleFonts.lato(
                          color: Color(0XFF2163CB),
                          fontWeight: FontWeight.w600,
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
                              for (var i = 0; i < widget.nb; i++) {
                                print(items[i].ref);
//here was validator condition
                                save(items[i]);
                                //print(items[i]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new AjouterFour()));
                              }
                            },
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
            //---------//
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        //topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: ListView.separated(
                    addAutomaticKeepAlives: false,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[400],
                      );
                    },
                    itemCount: widget.nb,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 5, bottom: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 220,
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: keys[index],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "ARTICLE: " + (index + 1).toString(),
                                style: GoogleFonts.lato(
                                  color: Color(0XFF2163CB),
                                  fontSize: 15,
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
                                          items[index].ref = val;
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
                                        labelText: 'Référence',
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.text,
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
                                          items[index].qte = int.parse(val);
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
                                        suffix: Text(
                                          "pièces",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        labelText: 'Nombre de pièces',
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
                                          items[index].cout = int.parse(val);
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
                                        labelText: 'Cout total',
                                        border: InputBorder.none,
                                        counter: const SizedBox(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLength: 1024,
                                      textCapitalization:
                                          TextCapitalization.sentences,
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
                                          items[index].consomation =
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
                                        labelText: 'Consomation',
                                        suffix: Text(
                                          "pièce par jour",
                                          style: TextStyle(fontSize: 11),
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
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
