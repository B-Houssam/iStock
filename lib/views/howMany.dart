import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/views/HomePage.dart';
import 'package:iStock/views/ajouterOne.dart';

class AjouterTwo extends StatefulWidget {
  AjouterTwo({Key key}) : super(key: key);

  @override
  _AjouterTwoState createState() => _AjouterTwoState();
}

class _AjouterTwoState extends State<AjouterTwo> {
  var txt = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int nb = 0;

  _remNewContactRow() {
    if (txt.text.isEmpty) {
      setState(() {
        txt.text = "1";
        nb = int.parse(txt.text);
      });
    } else {
      if (int.parse(txt.text) != 1) {
        setState(() {
          txt.text = (int.parse(txt.text) - 1).toString();
          nb = int.parse(txt.text);
        });
      }
    }
  }

  _addNewContactRow() {
    if (txt.text.isEmpty) {
      setState(() {
        txt.text = "1";
        nb = int.parse(txt.text);
      });
    } else {
      setState(() {
        txt.text = (int.parse(txt.text) + 1).toString();
        nb = int.parse(txt.text);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    txt.text = "10";
    setState(() {
      nb = int.parse(txt.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XFFE9E9F9),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                            FontAwesomeIcons.chevronLeft,
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
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                print(nb);
                                _formKey.currentState.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new AjouterOne(
                                              nb: nb,
                                            )));
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
            /////////////////////
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            //topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Combien de produits voulez \nvous ajouter ?",
                                style: GoogleFonts.lato(
                                  color: Color(0XFF2163CB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: txt,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Obligatoir';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            nb = int.parse(val);
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          border: InputBorder.none,
                                          counter: const SizedBox(),
                                        ),
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .13,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .13,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            _remNewContactRow();
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            color: Color(0XFF2163CB),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .13,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .13,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            _addNewContactRow();
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            color: Color(0XFF2163CB),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
