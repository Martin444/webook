import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webook/User/Models/resturant.dart';
import 'package:webook/User/widgets/hero.dart';

import 'card_explorer.dart';

class ExploreListFilter extends StatelessWidget {
  String category;

  ExploreListFilter(this.category);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('restaurants').where("category", isEqualTo: category).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          AsyncSnapshot image = snapshot;
          List<CardExplore> cards = new List<CardExplore>();
            List<HeroExplore> hero = new List<HeroExplore>();
          image.data.documents.forEach((f){
            var restaurant = Restaurant(name: f['name'],
              subname: f['subname'],
              description: f['description'],
              photoPortail: f['photoPortail'],
              textprev: f['textprev'],
              hourclose: f['hourclose'],
              houropen: f['houropen'],
              direction: f['direction'],
              delivery: f['delivery'],
              favorite: f['favorites']
            );
              
              cards.add(CardExplore(restaurant));
              restaurant.favorite == 10 ?
              hero.add(HeroExplore(restaurant))
              : null;
            });
            
          return Scaffold(
            body: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          children: hero,
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          children: cards,
                        )
                      )
                    ],
                  ),
          );
        }else{
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
                    child: Text("No se encuentran los datos "),
                  ),
          );
        }
    });
  }
}