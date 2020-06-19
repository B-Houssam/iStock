import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 30, left: 25, right: 25),
        child: Container(
          decoration: BoxDecoration(
            //color: Color(0XFF32CD32),
            gradient: LinearGradient(colors: [
              Color(0XFF36D459),
              Color(0XFF0BC53C),
            ]),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
