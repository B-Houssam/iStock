import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produit.dart';
import 'package:iStock/widgets/mainView/custom-drawer.dart';
import 'package:iStock/widgets/mainView/action-bar.dart';
import 'package:iStock/widgets/mainView/get-username.dart';
import 'List-produits.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Produit> _produits = [];

  Color col1 = Color(0XFF36D459);
  Color col2 = Color(0XFF0BC53C);
  //col1 = Color(0XFF00F260);
  //col2 = Color(0XFF0575E6);

  int count = 0;
  Icon _icon = Icon(
    FontAwesomeIcons.check,
    color: Colors.white,
    size: 80,
  );
  String mssg = "Très Bien!";

  _fetchProducts() async {
    List<Produit> productList = await DatabaseProvider.db.getProduits();
    setState(() {
      _produits = productList;
    });
  }

  _all(int qte, int seuil) {
    return (((qte * 100) / seuil));
  }

  _check() async {
    List<Produit> productList = await DatabaseProvider.db.getProduits();
    productList.forEach((element) {
      if (element.qte < element.seuil) {
        setState(() {
          col1 = Color(0XFFED213A);
          col2 = Color(0XFF93291E);
          count++;
          mssg = "Attenntion!";
          _icon = Icon(
            FontAwesomeIcons.exclamation,
            color: Colors.white,
            size: 80,
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _check();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Draw(),
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .12,
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
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                        child: Icon(
                          FontAwesomeIcons.bars,
                          color: Color(0XFF2163CB),
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .16,
                        height: MediaQuery.of(context).size.width * .16,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: MaterialButton(
                                minWidth:
                                    MediaQuery.of(context).size.width * .13,
                                height: MediaQuery.of(context).size.width * .13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                color: Colors.white,
                                onPressed: () {},
                                child: Icon(
                                  FontAwesomeIcons.bell,
                                  color: Color(0XFF2163CB),
                                  size: 25,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * .05,
                                height: MediaQuery.of(context).size.width * .05,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFED213A),
                                ),
                                child: Text(
                                  count.toString(),
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            //---------- main card starts here ------------------- //

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ALL()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .3,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 30, left: 25, right: 25),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            col1,
                            col2,
                          ]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _icon,
                            Container(
                              //color: Colors.black,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    mssg,
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        count.toString(),
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Alertes des\nproduits",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Vérifier list produits",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.longArrowAltRight,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: -25,
                        bottom: -20,
                        child: Opacity(
                          opacity: .3,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .35,
                            height: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        top: -40,
                        child: Opacity(
                          opacity: .4,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .19,
                            height: MediaQuery.of(context).size.width * .19,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .425,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
              ),
              child: Column(
                children: <Widget>[
                  GetName(),
                  _produits.length < 3
                      ? Expanded(
                          child: Center(
                              child: Text(
                            "Commencer par ajouter des produits",
                            style: GoogleFonts.lato(
                              color: Colors.grey[400],
                            ),
                          )),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 15),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, left: 25),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(60),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Color(0XFF7771F6),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            _all(
                                                  _produits[0].qte,
                                                  _produits[0].seuil,
                                                ).toString() +
                                                "%",
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              _produits[0].nom,
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(60),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Color(0XFF938DF8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            _all(
                                                  _produits[1].qte,
                                                  _produits[1].seuil,
                                                ).toString() +
                                                "%",
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              _produits[1].nom,
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(60),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Color(0XFFEE651F),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            _all(_produits[2].qte,
                                                        _produits[2].seuil)
                                                    .toString() +
                                                "%",
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              _produits[2].nom,
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Opacity(
                                    opacity: .5,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Color(0XFF50818A),
                                      ),
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(60),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      new ALL()));
                                        },
                                        child: Center(
                                          child: Text(
                                            "Voir tout les produits",
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
            ActionB(),
          ],
        ),
      ),
    );
  }
}
