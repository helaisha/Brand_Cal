import 'package:firebase_authentication_tutorial/Screen/ProviderHelper/ProviderState.dart';
import 'package:firebase_authentication_tutorial/Screen/ProviderLogin.dart';
import 'package:flutter/material.dart';
// import '../Screen/Dashboard.dart';
// import '../Screen/LoginPage.dart';
// import '../Screen/RegistrationPage.dart';
import 'package:firebase_core/firebase_core.dart';
// import '../WelcomePage.dart';
// import 'isSignedIn.dart';
import 'package:get/get.dart';

//import 'InstanceBinding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/ProviderHelper/ProviderState.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) =>ProviderState())],
    child: MyProviderApp() ,
  )
  );

//       MyApp());
 }


class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: ProviderLogin(),
      debugShowCheckedModeBanner: false,

    );
  }
}


//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialBinding: InstanceBinding(),
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: IsSignedIn(),
//       routes: {
//         '/welcome':(context) => WelcomePage(),
//         '/login':(context)=> LoginPage(),
//         '/reg':(context)=>RegistrationPage(),
//         '/dashboard':(context)=>Dashboard(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//
//
//     );
//   }
// }

