import 'package:flutter/material.dart';
import 'package:iStock/widgets/bottom-card.dart';
import 'package:iStock/widgets/main-card.dart';
import 'package:iStock/widgets/top-bar.dart';
import 'package:iStock/widgets/action-bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(),
            MainCard(),
            BottomCard(),
            ActionB(),
          ],
        ),
      ),
    );
  }
}
