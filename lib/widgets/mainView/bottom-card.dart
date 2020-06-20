import 'package:flutter/material.dart';
import 'package:iStock/widgets/mainView/get-username.dart';
import 'package:iStock/widgets/mainView/list-view.dart';

class BottomCard extends StatefulWidget {
  BottomCard({Key key}) : super(key: key);

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .425,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
      ),
      child: Column(
        children: <Widget>[
          GetName(),
          ListItems(),
        ],
      ),
    );
  }
}
