import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iStock/widgets/mainView/bottom-card.dart';
import 'package:iStock/widgets/mainView/custom-drawer.dart';
import 'package:iStock/widgets/mainView/main-card.dart';
import 'package:iStock/widgets/mainView/action-bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: MediaQuery.of(context).size.width * .13,
                      height: MediaQuery.of(context).size.width * .13,
                      child: RaisedButton(
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
                  ],
                ),
              ),
            ),
            MainCard(),
            BottomCard(),
            ActionB(),
          ],
        ),
      ),
    );
  }
}
