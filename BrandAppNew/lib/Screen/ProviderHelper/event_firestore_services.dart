import 'package:firebase_helpers/firebase_helpers.dart';

import 'app_event.dart';
// import 'firebase_helpers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'data_constants.dart';


//final databaseReference = FirebaseDatabase.instance.reference();

final eventDBS = DatabaseService<AppEvent>(AppDBConstants.eventsCollection,
    fromDS: (id, data) => AppEvent.fromDS(id, data),
    toMap: (event)=> event.toMap()) ;

