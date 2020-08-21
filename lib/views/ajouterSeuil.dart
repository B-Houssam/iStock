import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/views/HomePage.dart';
import 'package:iStock/views/final.dart';

class AjouterFour extends StatefulWidget {
  AjouterFour({Key key}) : super(key: key);

  @override
  _AjouterFourState createState() => _AjouterFourState();
}

class _AjouterFourState extends State<AjouterFour> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  int a = 3500;
  int b = 2500;
  int c = 35;
  int d = 25;

  var txt = TextEditingController();
  var txt1 = TextEditingController();
  var txt2 = TextEditingController();
  var txt3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    txt.text = "3500";
    txt1.text = "2500";
    txt2.text = "35";
    txt3.text = '25';
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
                            onPressed: () {
                              //
                              if (_formKey.currentState.validate() &&
                                  _formKey1.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new AjouterFive(
                                              a: a,
                                              b: b,
                                              c: c,
                                              d: d,
                                            )),
                                    (Route<dynamic> route) =>
                                        false).then((value) => setState(() {}));
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
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Spécifier Les seuils par classes.",
                                style: GoogleFonts.lato(
                                  color: Color(0XFF2163CB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 27,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Cout",
                                        style: GoogleFonts.lato(
                                          color: Color(0XFF2163CB),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                controller: txt,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return 'Obligatoir';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val) {
                                                  setState(() {
                                                    a = int.parse(val);
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "A > X",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  border: InputBorder.none,
                                                  counter: const SizedBox(),
                                                ),
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                controller: txt1,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return 'Obligatoir';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val) {
                                                  setState(() {
                                                    b = int.parse(val);
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "X > B > Y",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  border: InputBorder.none,
                                                  counter: const SizedBox(),
                                                ),
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Consomation",
                                        style: GoogleFonts.lato(
                                          color: Color(0XFF2163CB),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        child: Form(
                                          key: _formKey1,
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                controller: txt2,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return 'Obligatoir';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val) {
                                                  setState(() {
                                                    c = int.parse(val);
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "A > X",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  border: InputBorder.none,
                                                  counter: const SizedBox(),
                                                ),
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                controller: txt3,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return 'Obligatoir';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val) {
                                                  setState(() {
                                                    d = int.parse(val);
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "X > B > Y",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                  border: InputBorder.none,
                                                  counter: const SizedBox(),
                                                ),
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                              ),
                                            ],
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
