import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iStock/db/db-provider.dart';
import 'package:iStock/models/produitf.dart';
import 'package:iStock/views/detalisAvant.dart';
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
  List<Produitf> _produits = [];

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
    List<Produitf> productList = await DatabaseProvider.db.getProduitsF();
    setState(() {
      _produits = productList;
    });
  }

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

  _check() async {
    List<Produitf> productList = await DatabaseProvider.db.getProduitsF();
    productList.forEach((element) {
      if (element.qq <= element.stockAl) {
        setState(() {
          col1 = Color(0XFFED213A);
          col2 = Color(0XFF93291E);
          count++;
          mssg = "Attention!";
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
                      width: MediaQuery.of(context).size.width * .16,
                      height: MediaQuery.of(context).size.width * .16,
                      child: Center(
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * .13,
                          height: MediaQuery.of(context).size.width * .13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          color: Color(0XFFF0A12F),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AjouterTree()));
                          },
                          child: Icon(
                            FontAwesomeIcons.table,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .16,
                      height: MediaQuery.of(context).size.width * .16,
                      child: Center(
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * .13,
                          height: MediaQuery.of(context).size.width * .13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          color: Color(0XFFF0A12F),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ALL()));
                          },
                          child: Icon(
                            FontAwesomeIcons.list,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
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
                                        "Alertes des\narticles",
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
                                        "Vérifier liste articles",
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
                  _produits.length == 0
                      ? Expanded(
                          child: Center(
                              child: Text(
                            "Commencer par ajouter des articles",
                            style: GoogleFonts.lato(
                              color: Colors.grey[400],
                            ),
                          )),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 15),
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _produits.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, left: 25),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: _cal(_produits[index].qq,
                                            _produits[index].stockAl),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                _produits[index].ref,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "Stock Actuel: " +
                                                    _produits[index]
                                                        .qq
                                                        .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "Stock Alert: " +
                                                    _produits[index]
                                                        .stockAl
                                                        .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
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
            ActionB(),
          ],
        ),
      ),
    );
  }
}
