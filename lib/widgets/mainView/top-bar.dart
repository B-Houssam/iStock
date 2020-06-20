import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {},
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
    );
  }
}
