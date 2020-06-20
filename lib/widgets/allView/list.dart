import 'package:flutter/material.dart';
import 'package:iStock/widgets/allView/ont-item.dart';

class ListAll extends StatefulWidget {
  ListAll({Key key}) : super(key: key);

  @override
  _ListAllState createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 15),
          children: <Widget>[
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
          ],
        ),
      ),
    );
  }
}
