import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webook/User/Models/resturant.dart';

class BarTopDetails extends StatefulWidget {
  Restaurant restaurant;
  bool favorite = false;

  BarTopDetails(this.restaurant);

  @override
  _BarTopDetailsState createState() => _BarTopDetailsState();
}

class _BarTopDetailsState extends State<BarTopDetails> {
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
                                widget.favorite ? Icons.favorite : Icons.favorite_border,
                                size: 28,
                                color: Colors.white,
                                ),
                          onTap: () async {

                            await Firestore.instance.collection('restaurants').document(widget.restaurant.restid).get()
                            .then((DocumentSnapshot ds){
                              int favorites = ds.data['favorites'];


                              setState(() {
                                widget.favorite = !widget.favorite;
                              });
                              
                              Firestore.instance.collection('restaurants').document(widget.restaurant.restid)
                              .updateData({
                                'favorites' : favorites + 1
                              });

                              

                            });
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