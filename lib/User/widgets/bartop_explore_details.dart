import 'package:flutter/material.dart';

class BarTopDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15, top: 18),
            child: InkWell(
                child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                    ),
                  
          ),

          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 15,top: 18),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: InkWell(
                child: Icon(
                        Icons.share,
                        size: 28,
                        color: Colors.white,
                        ),
                        onTap: (){
                          Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Compartiste esto"),
                              )
                            );
                        },
                    ),
                ),
                    InkWell(
                        child: Icon(
                                Icons.favorite_border,
                                size: 28,
                                color: Colors.white,
                                ),
                          onTap: (){
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Agregaste a tus favoritos"),
                              )
                            );
                          },
                    ),
              ],
            )
          ),
        ],
      ),
    );
  }
}