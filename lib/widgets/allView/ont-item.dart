import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Item extends StatefulWidget {
  Item({Key key}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .16,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .23,
            height: MediaQuery.of(context).size.width * .23,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Item",
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .01,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .008,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .008,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "20 pièces dans le stock",
                style: GoogleFonts.lato(
                  color: Color(0XFF2163CB),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * .11,
            height: MediaQuery.of(context).size.width * .11,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.pen,
                color: Color(0XFF2163CB),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
