import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/views/HomePage.dart';
import 'package:iStock/widgets/addView/top-bar.dart';

class AddItem extends StatefulWidget {
  AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String nom = '';
  String description = '';
  int id = 0;
  int qte = 0;
  int seuil = 0;
  String fournisseur = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    save(Produit p) async {
      Produit test;
      test = await DatabaseProvider.db.insert(p);
      if (test != null) {
        print("inserted !");
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0XFFE9E9F9),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TopBar(),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
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
                                      id = int.parse(val);
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
                                    labelText: 'ID',
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
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
                                      nom = val;
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
                                    labelText: 'Nom',
                                    border: InputBorder.none,
                                    counter: const SizedBox(),
                                  ),
                                  maxLines: 1,
                                  maxLength: 1024,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  //readOnly: !_note.state.canEdit,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Obligatoir';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      qte = int.parse(val);
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
                                    labelText: 'Quantité',
                                    border: InputBorder.none,
                                    counter: const SizedBox(),
                                  ),
                                  maxLines: 1,
                                  maxLength: 1024,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  //readOnly: !_note.state.canEdit,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Obligatoir';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      fournisseur = val;
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
                                    labelText: 'Fournisseur',
                                    border: InputBorder.none,
                                    counter: const SizedBox(),
                                  ),
                                  maxLines: 1,
                                  maxLength: 1024,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  //readOnly: !_note.state.canEdit,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Obligatoir';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      description = val;
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
                                    labelText: 'Déscription',
                                    border: InputBorder.none,
                                    counter: const SizedBox(),
                                  ),
                                  maxLines: 1,
                                  maxLength: 1024,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  //readOnly: !_note.state.canEdit,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Obligatoir';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      seuil = int.parse(val);
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
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    labelText: 'Seuil',
                                    border: InputBorder.none,
                                    counter: const SizedBox(),
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  //readOnly: !_note.state.canEdit,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .065,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  print("validated");
                                  _formKey.currentState.save();
                                  Produit p = new Produit(
                                    description: description,
                                    id: id,
                                    fournisseur: fournisseur,
                                    nom: nom,
                                    qte: qte,
                                    seuil: seuil,
                                  );
                                  save(p);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => new HomePage()),
                                      (Route<dynamic> route) =>
                                          false).then(
                                      (value) => setState(() {}));
                                } else {
                                  print("not validated");
                                }
                              },
                              color: Color(0XFFF0A12F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                              child: Text(
                                "Ajouter",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
