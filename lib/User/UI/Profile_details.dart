import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webook/User/Models/user.dart';
import 'package:webook/User/UI/utils.dart';
import 'package:webook/User/widgets/actionsMood.dart';
import 'package:webook/Widgets/button_custom.dart';

import 'Explore_details.dart';
import 'Profile.dart';


class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
           return Scaffold(
                  body: Stack(
                        children: <Widget>[
                          ListView(
                            children: <Widget>[
                              Text(
                                  "Usuario no logeado. Haz Login",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                );
        }else{
        var user = User(
                    uid: snapshot.data.uid,
                    name: snapshot.data.displayName,
                    email: snapshot.data.email,
                    photoURL: snapshot.data.photoUrl
                );
           return Scaffold(
              body: SingleChildScrollView(  
                child: Container( 
                  width: MediaQuery.of(context).size.width,
                  color: mainBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          _backCover(),
                          _greetings(user),
                          _bottomHolder(),
                        ],

                      ),

                      SizedBox(height: 70.0),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _buildNotificationCard(),
                          //  _buildYourDriverDesigned(),
                          //  _buildYourDriverDesignedCard(),
                            _buildTourFavoritePlaces(),
                            CarouselSlider(
                              height: 300.0,
                              enableInfiniteScroll: false,
                              autoPlay: false,
                              items: <Widget>[
                                _buildYourFavoritePlacesCard("places"),
                                _buildYourFavoritePlacesCard("hero"),
                                _buildYourFavoritePlacesCard("hotel"),
                                _buildYourFavoritePlacesCard("restaurant")
                              ]
                            ),
                          ]
                        ),
                      )
                    ],
                  ),
                ),   
                
              ),
              
            );
        }
      },
    );

    
  }

    Container _backCover() {
    return Container(
                  padding: EdgeInsets.all(20.0),
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)
                      ),    
                     gradient: LinearGradient(
                       colors: <Color>[
                       mainC,midC,lightC,
                     ],
                     stops: [0.0,0.5,0.9],
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,
                     ),
                  ),
                  
                   
                  
                

                );
  }

    Positioned _greetings(user){
        return Positioned(
          left: 20,
          bottom: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi ${user.name}',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  
                ),
              ),
              SizedBox(height: 6.0,),
              Text(
                'How are you feeling today ?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        );
  }

    Positioned _bottomHolder(){
    return Positioned(
      left: 10,
      right: 10,
      top: 200,

      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.5,
            blurRadius: 5.5,
          )]
        ),
        child: MyActions(),
      ),
    );
  }

    Container _buildNotificationCard(){
      return Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: lightC,
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(
          leading: Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 32,
          ),
          title: Text("Do not miss the opportunity to book a hotel",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),
          ),
          trailing: OutlineButton(
            onPressed: (){
              Navigator.push(context,
                   MaterialPageRoute(
                      builder: (BuildContext context) =>
                     ProfileUser()
                  )
              );
            },
            color: Colors.transparent,
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26)
            ),
            child: Text("Booking",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              ),
            ),
        ),
      );
    }
  
    Container _buildYourDriverDesigned(){
      return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Your designed driver",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ),
              )
          ],
        ),
      );
    }

    _buildYourDriverDesignedCard() {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage("https://microhealth.com/assets/images/illustrations/personal-user-illustration-@2x.png"),
                        radius: 36,
                      ),
                      SizedBox(width: 12.0,),
                      RichText(
                        text: TextSpan(
                        text: 'John Colon',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 2.5,
                        ),
                      ),
                      ),
                        ],),
                      ),
                      ButtonCustom(
                        text: "Go",
                        height: 40,
                        width: 80,
                        onPressed: (){},
                        )

                    ],
                  )
                ],
              ),
            ),
          );
}

    Container _buildTourFavoritePlaces(){
            return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Your Favorite Places",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ),
              )
          ],
        ),
      );
    }

    _buildYourFavoritePlacesCard(String _tag){
              return InkWell(
                onTap: (){},
                child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
                
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            // Navigator.push(context,
                            //   new MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //       // new ExploreDetails()
                            //   )
                          // );
                          },
                          child: Container(
                            child: Column(children: <Widget>[
                            Hero(
                              tag: _tag,
                              child: Image.network(
                                "https://media-cdn.tripadvisor.com/media/photo-s/14/d3/78/6f/vella-elegant-restaurant.jpg",
                                 fit: BoxFit.cover,
                                 width: 350,
                                 ),
                            ),
                          SizedBox(width: 12.0,),
                          RichText(
                            text: TextSpan(
                            text: 'Cocora Bar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 2.5,
                            ),
                          
                          ),
                          ),
                            ],),
                          ),
                        ),
                        InkWell( 
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.favorite, color: Colors.pinkAccent, size: 38,),
                          ),)

                      ],
                    )
                  ],
                ),
            ),
          ),
              );
    }


}
