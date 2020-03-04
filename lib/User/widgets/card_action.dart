import 'package:flutter/material.dart';

class CardAction extends StatelessWidget {

  String title;
  String pathImage;
  VoidCallback rute;

  CardAction(this.title, this.pathImage, this.rute);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
      height: 90,
      width: 115,
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 11.0,
                offset: Offset(0.0, 4.4)
                )
            ],
            color: Colors.white
        ),

      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(pathImage, fit: BoxFit.contain, ),
                    Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        ),
        ],
      ),
    ),
      onTap:rute,
    );
  }
}