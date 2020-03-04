import 'package:flutter/material.dart';
import 'package:webook/User/widgets/background.dart';
import 'package:webook/User/widgets/bar_top.dart';
import 'package:webook/User/widgets/explore_list.dart';
import 'package:webook/User/widgets/hero.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
        children: <Widget>[
        ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ExploreList(),
                        ],
                      ),
                    ],
                  ),
                ]
            ),
        GradientBack(height: 50,),
        BarTop(),
      ],),
      )
    );
  }
}
