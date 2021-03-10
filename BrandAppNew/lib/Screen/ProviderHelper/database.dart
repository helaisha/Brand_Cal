// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// //import 'add_event.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// //import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_helpers/firebase_helpers.dart';
// //
// // class DatabaseMethods {
// //  Future addUserInfoToDB(
// //      String userId, Map<String, dynamic>userInfoMap) async{
// //     FirebaseFirestore.instance.collection("users").doc(userId).set(userInfoMap)
// //   }
// // }
// //
// //
//
//
//
// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized() ;
// //   await Firebase.initializeApp() ;
// //
// //   runApp(FirebaseDemoScreen ());
// // }
//
// class FirebaseDemoScreen extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     //getData();
//     return  MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Firebase Connect'),
//         ),
//         body: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//
//                 RaisedButton(
//                   child: Text('Create Record'),
//                   onPressed: () {
//                     createRecord();
//
//
//                   },
//                 ),
//
//                 RaisedButton(
//                   child: Text('View Record'),
//                   onPressed: () {
//                     //getData();
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text('Udate Record'),
//                   onPressed: () {
//                   //  updateData();
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text('Delete Record'),
//                   onPressed: () {
//                     //deleteData();
//                   },
//                 ),
//               ],
//             )
//         ), //center
//       ),
//     );
//   }
//   // //final databaseReference = FirebaseDatabase.instance.reference();
//   // Future<void> userSetup(String title) async {
//   // CollectionReference databaseReference = FirebaseFirestore.instance.collection('databaseReference');
//   // databaseReference.add({'title': 'Mastering EJB',
//   //   'description': 'Programming Guide for J2EE' }) ;
//   // return;
//   // }
//
//
//
//   void createRecord() {
//     CollectionReference databaseReference = FirebaseFirestore.instance
//         .collection('databaseReference');
//     databaseReference.add({'title': 'Mastering EJB',
//       'description': 'Programming Guide for J2EE'});
//     return;
//   }
// //
// //
// //   void createRecord(){
// //     databaseReference.child("1").set({
// //       'title': 'Mastering EJB',
// //       'description': 'Programming Guide for J2EE'
// //     });
// //     databaseReference.child("2").set({
// //       'title': 'Flutter in Action',
// //       'description': 'Complete Programming Guide to learn Flutter'
// //     });
// //   }
// //   void getData(){
// //     databaseReference.once().then((DataSnapshot snapshot) {
// //       print('Data : ${snapshot.value}');
// //     });
// //   }
// //
// //   void updateData(){
// //     databaseReference.child('1').update({
// //       'description': 'J2EE complete Reference'
// //     });
// //   }
// //
// //   void deleteData(){
// //     databaseReference.child('1').remove();
// //   }
// }
