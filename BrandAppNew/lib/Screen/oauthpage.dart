import 'package:firebase_authentication_tutorial/Screen/ProviderRegistration.dart';
import 'package:firebase_authentication_tutorial/Screen/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import '../Screen/ProviderLogin.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Screen/ProviderDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http ;
import 'dart:ffi';
import 'dart:math';
import '../Screen/ProviderHelper/ProviderState.dart';
import 'publishing.dart';


class Oauth extends StatefulWidget {
  @override
  _OauthState createState() => _OauthState();
}

class _OauthState extends State<Oauth> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // get facebookSignIn => null;
  //
  // get http => null;

  void _signInfacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();

    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);
    try {
      if (await _providerState.signInfacebook()) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Publishing()));
      }
    } catch (e) {
      print(e);
    }
  }


  // final result = await facebookLogin.logIn(['email']);
  // final token = result.accessToken.token;
  // final graphResponse = await http.get(
  //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=${token}');
  // print(graphResponse.body);
  // if(result.status== FacebookLoginStatus.loggedIn){
  //   final credential = FacebookAuthProvider.credential(token) ;
  //   _auth.signInWithCredential(credential) ;
  // }


  void _signInTwitter() async {
    // FacebookLogin facebookLogin = FacebookLogin() ;

    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);
    try {
      if (await _providerState.signInTwitter()) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Publishing()));
      }
    } catch (e) {
      print(e);
    }
  }

  //   void _signInTwitter() async {
  //   var twitterLogin = new TwitterLogin(
  //     consumerKey: 'mzlj5A21bXz6qxeX9go6iQaKP',
  //     consumerSecret: 'CCCITbAcpwPvdpNke47F7FC3J9Wu6z8TFYFYvE9NbdrdtIGkST',
  //   );
  //
  //   final TwitterLoginResult result = await twitterLogin.authorize();
  //
  //   switch (result.status) {
  //     case TwitterLoginStatus.loggedIn:
  //       var session = result.session;
  //       print(session.username);
  //       print(session.userId);
  //       print(result);
  //     //  _sendTokenAndSecretToServer(session.token, session.secret);
  //       break;
  //     case TwitterLoginStatus.cancelledByUser:
  //       // _showCancelMessage();
  //     print('cancelled by user') ;
  //       break;
  //     case TwitterLoginStatus.error:
  //       print(result.errorMessage);
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.white,
                              Colors.lightBlueAccent,

                            ]
                        )
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                HeightBox(180),
                                GestureDetector(
                                    onTap: () {
                                      // final close = context.showLoading(msg: "Loading");
                                      // Future.delayed(4.seconds, close); // Removes toast after 2 seconds
                                      _signInfacebook();
                                    },
                                    child: "Sign-Up with facebook".text.white
                                        .light.xl
                                        .makeCentered()
                                        .box
                                        .white
                                        .shadowOutline(
                                        outlineColor: Colors.grey)
                                        .color(Color(0x000000ff))
                                        .roundedLg
                                        .make()
                                        .w(300)
                                        .h(40)),

                                HeightBox(50),

                                GestureDetector(
                                    onTap: () {
                                      _signInTwitter();
                                      // final close = context.showLoading(msg: "Loading");
                                      // Future.delayed(4.seconds, close); // Removes toast after 2 seconds
                                      // // RegisterUser(email.text,password.text,context);
                                      // //
                                      // // _signUp(email.text, password.text, context);
                                    },
                                    child: "Sign-Up with twitter".text.white
                                        .light.xl
                                        .makeCentered()
                                        .box
                                        .white
                                        .shadowOutline(
                                        outlineColor: Colors.grey)
                                        .color(Color(0XFFFF0772))
                                        .roundedLg
                                        .make()
                                        .w(300)
                                        .h(40)),

                                HeightBox(50),

                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (
                                          context) => ProviderRegistration()));
                                    },
                                    child: "Go Back".text.white.light.xl
                                        .makeCentered()
                                        .box
                                        .white
                                        .shadowOutline(
                                        outlineColor: Colors.grey)
                                        .color(Color(0XFFFF0772))
                                        .roundedLg
                                        .make()
                                        .w(100)
                                        .h(40)),


                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}