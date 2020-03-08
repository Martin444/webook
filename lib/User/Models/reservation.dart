import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Reservation {
  String nameUser;
  String commercePhoto;
  String commerceName;
  String commerce;
  String userOwner;
  Timestamp date;

  Reservation({
    Key key,
    @required this.nameUser,
    @required this.commerceName,
    @required this.commercePhoto,
    @required this.commerce,
    @required this.userOwner,
    @required this.date
  });

}