import 'package:flutter/material.dart';
import 'package:webook/User/Models/resturant.dart';
import 'package:webook/Widgets/button_blue.dart';

class ReserveButtons extends StatelessWidget {
  Restaurant restaurant;

  ReserveButtons(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.15,),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 14.0,
              )
          ]
      ),

      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: ButtonBlue(
            width: 130,
            height: 50, 
          onPressed: (){

              Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Reservado"),
                                      )
                                    );
          }, text: "Reservar",),
          ),

          restaurant.delivery ? 
          Container(
            height: 48,
            width: 60,
            margin: EdgeInsets.only(top: 12,bottom: 8),
            child: FlatButton(
              color: Colors.black12,
              child: Icon(Icons.time_to_leave),
              onPressed: (){
                 
              },
            ),
          )
          : SizedBox(height: 30),

          Container(
            height: 48,
            width: 60,
            margin: EdgeInsets.only(top: 12,bottom: 8, left: 16),
            child: FlatButton(
              child: Icon(Icons.location_on),
              color: Colors.black12,
              onPressed: (){
                      Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Buscando"),
                              )
                            );
              },
            ),
          )
        ],
      ),
    );
  }
}