import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .12,
      decoration: BoxDecoration(
          //color: Colors.white,
          ),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .13,
              //height: MediaQuery.of(context).size.height * .13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                FontAwesomeIcons.bars,
                color: Color(0XFF2163CB),
                size: 25,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .13,
              //height: MediaQuery.of(context).size.height * .13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Color(0XFF2163CB),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
