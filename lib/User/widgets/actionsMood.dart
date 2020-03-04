import 'package:flutter/material.dart';
import 'package:webook/User/UI/Profile.dart';
import 'package:webook/User/widgets/card_action.dart';
import 'package:webook/User/widgets/explore_list_filter.dart';

class MyActions extends StatefulWidget {
  @override
  _MyActionsState createState() => _MyActionsState();
}

class _MyActionsState extends State<MyActions> {
List<bool> isSeled = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: <Widget>[ ToggleButtons(
        selectedBorderColor: Colors.purple,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Column(
            children: <Widget>[
            Icon(Icons.explore, size: 38),
            Text("Explorer")
          ],),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Column(children: <Widget>[
            Icon(Icons.hotel, size: 38),
            Text("Hotel")
          ],),
          ),
          Column(children: <Widget>[
            Icon(Icons.restaurant, size: 38),
            Text("Restaurant")
          ],),
        ],
        isSelected: isSeled,
        onPressed: (int index){
          isSeled[index] = !isSeled[index]; 
          if(index == 0 ){
            Navigator.push(context,
                   MaterialPageRoute(
                      builder: (BuildContext context) =>
                     ProfileUser()
                  )
              );
          }else if(index == 1 ){
            showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context){
              return Container(
                height: 150,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                      Container(
                    
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          "Para",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 0, left: 16),
                          child: FlatButton(
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.perm_identity),
                                Text("Uno")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                    
                            },
                          ),
                        ),

                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 12, left: 16),
                          child: FlatButton(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.group),
                                Text("Dos")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                  
                            },
                          ),
                        ),

                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 12, left: 16),
                          child: FlatButton(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.group_add),
                                Text("Más")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                  
                            },
                          ),
                        )
                    ],)
                  ],
                ),
              );
            });
          }else{
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context){
                return Container(
                  height: 450,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            "What do you crave?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CardAction("Mexican", 'assets/mexican.jpg', (){
                                   Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Mexican")
                                        )
                                    );
                                }),
                                CardAction("Sushi", 'assets/sushi.jpg', (){
                                   Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Sushi")
                                        )
                                    );
                                }),
                                CardAction("Italiana", 'assets/italiana.png', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Italiana")
                                        )
                                    );
                                })

                              ],
                            ),
                            Column(
                              children: <Widget>[
                                CardAction("Steakhouse", 'assets/Steakhouse.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Steakhouse")
                                        )
                                    );
                                }),
                                CardAction("Seafood", 'assets/Seafood.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Seafood")
                                        )
                                    );
                                }),
                                CardAction("Asiática", 'assets/asiatica.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Asiática")
                                        )
                                    );
                                })
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                CardAction("Healthy", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Healthy")
                                        )
                                    );
                                }),
                                CardAction("Americana", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Americana")
                                        )
                                    );
                                }),
                                CardAction("Argentina", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Argentina")
                                        )
                                    );
                                })
                              ],
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                );}
          );
          }
          print(index);
        },
      ),

      ]
    );
  }
}