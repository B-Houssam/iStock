import 'package:flutter/material.dart';
import 'package:iStock/widgets/allView/top-bar.dart';

class ALL extends StatefulWidget {
  ALL({Key key}) : super(key: key);

  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE9E9F9),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BackBar(),
          ],
        ),
      ),
    );
  }
}
