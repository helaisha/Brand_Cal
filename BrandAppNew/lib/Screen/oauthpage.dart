import 'package:firebase_authentication_tutorial/Screen/ProviderRegistration.dart';
import 'package:firebase_authentication_tutorial/Screen/constants.dart';
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
import 'linkedin.dart';
import 'publishing.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:dio/dio.dart';
import 'package:flutter_json_widget/flutter_json_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'linkedin.dart';


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

  void _signInWithGoogle() async {
    // FacebookLogin facebookLogin = FacebookLogin() ;

    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);
    try {
      if (await _providerState.signInWithGoogle()) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Publishing()));
      }
    } catch (e) {
      print(e);
    }
  }


  //
  // UserObject user;
  // bool logoutUser = false;
  // //
  // final String redirectUrl = 'https://brandapp1-b1d48.firebaseapp.com/__/auth/handler';
  // final String clientId = '86ptn6jkomgcuu';
  // final String clientSecret = 'LwFPXf3Ctswi4rxl';

  // @TODO IMPORTANT - you need to change variable values below
// You need to add your own data from LinkedIn application
// From: https://www.linkedin.com/developers/
// Please read step 1 from this link https://developer.linkedin.com/docs/oauth2
  final String redirectUrl = 'https://brandapp1-b1d48.firebaseapp.com/__/auth/handler';
  final String clientId = '77e862l1cjcf7w';
  final String clientSecret = 'kW9fvDRx7eJ4RjBB';


  UserObject user;
  bool logoutUser = false;



  @override
  Widget build(BuildContext context) {
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    final Uiid =_providerState.linkedin_uid;
    final tokken =_providerState.linkedin_token;
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

                                HeightBox(130),
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
                                        .color(Color(0XFF448AFF))
                                        .roundedLg
                                        .make()
                                        .w(300)
                                        .h(40)),

                                HeightBox(20),

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
                                        .color(kPrimaryColor)
                                        .roundedLg
                                        .make()
                                        .w(300)
                                        .h(40)),

                                HeightBox(20),

                                GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     //maintainState: true,
                                      //       fullscreenDialog: false,
                                      //       builder: (context) => MyLinkedin()),
                                      // );
                                      // final close = context.showLoading(msg: "Loading");
                                      // Future.delayed(4.seconds, close); // Removes toast after 2 seconds
                                      // // RegisterUser(email.text,password.text,context);
                                      // //
                                      // // _signUp(email.text, password.text, context);
                                    },
                                    child: "Sign-Up with linkedin".text.white
                                        .light.xl
                                        .makeCentered()
                                        .box
                                        .white
                                        .shadowOutline(
                                        outlineColor: Colors.grey)
                                        .color(Color(0XFF0D47A1))
                                        .roundedLg
                                        .make()
                                        .w(300)
                                        .h(40)),

                                HeightBox(20),

                                GestureDetector(
                                    onTap: () {
                                      _signInWithGoogle();
                                      // final close = context.showLoading(msg: "Loading");
                                      // Future.delayed(4.seconds, close); // Removes toast after 2 seconds
                                      // // RegisterUser(email.text,password.text,context);
                                      // //
                                      // // _signUp(email.text, password.text, context);
                                    },
                                    child: "Sign-Up with google".text.white
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

                                HeightBox(20),

// Linkedin
                                Container(
                                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.0)),
                  child:


                LinkedInButtonStandardWidget(
                                  iconHeight: 40,
                                   iconWeight: 70,
                                  textPadding: EdgeInsets.only(left: 40.0, right: 40.0),


                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => LinkedInUserWidget(
                                          appBar: AppBar(
                                            title: Text('OAuth User'),
                                          ),
                                          destroySession: logoutUser,
                                          redirectUrl: redirectUrl,
                                          clientId: clientId,
                                          clientSecret: clientSecret,
                                          projection:  [
                                            ProjectionParameters.id,
                                            ProjectionParameters.localizedFirstName,
                                            ProjectionParameters.localizedLastName,
                                            ProjectionParameters.firstName,
                                            ProjectionParameters.lastName,
                                            ProjectionParameters.profilePicture,
                                          ],
                                          onGetUserProfile: (LinkedInUserModel linkedInUser) {
                                            print('Access token ${linkedInUser.token.accessToken}');

                                            print('User id: ${linkedInUser.userId}');
                                            _providerState.linkedin_uid = linkedInUser.userId;
                                            _providerState.linkedin_token = linkedInUser.token.accessToken ;

                                            user = UserObject(
                                              firstName: linkedInUser?.firstName?.localized?.label,
                                              lastName: linkedInUser?.lastName?.localized?.label,
                                              email: linkedInUser
                                                  ?.email?.elements[0]?.handleDeep?.emailAddress,
                                              profileImageUrl: linkedInUser?.profilePicture?.displayImageContent?.elements[0]?.identifiers[0]?.identifier,
                                            );

                                            setState(() {
                                              logoutUser = false;
                                            });

                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(builder: (context) => Publishing()));
                                          },
                                          catchError: (LinkedInErrorObject error) {
                                            print('Error description: ${error.description},'
                                                ' Error code: ${error.statusCode.toString()}');
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(builder: (context) => Publishing()));
                                          },
                                        ),
                                        fullscreenDialog: true,
                                      ),
                                    );
                                  },
                                ),
                                ),
                                // LinkedInButtonStandardWidget(
                                //   onTap: () {
                                //     setState(() {
                                //       user = null;
                                //       logoutUser = true;
                                //     });
                                //   },
                                //   buttonText: 'Logout',
                                // ),

                                HeightBox(20),
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
                                        .color(Color(0xFF000000))
                                        .roundedLg
                                        .make()
                                        .w(100)
                                        .h(40)),

                                HeightBox(20),

                                // HeightBox(20),

                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (
                                          context) => Link()));
                                    },
                                    child: "Linkedin SignIn".text.white.light.xl
                                        .makeCentered()
                                        .box
                                        .white
                                        .shadowOutline(
                                        outlineColor: Colors.grey)
                                        .color(Color(0xFF000000))
                                        .roundedLg
                                        .make()
                                        .w(200)
                                        .h(40)),

                                // LinkedInButtonStandardWidget(
                                //     onTap: linkedInLogin
                                // )

                                // LinkedInButtonStandardWidget(
                                //     onTap: linkedInLogin
                                // ),
                                // result != null && result.isNotEmpty
                                //     ? CachedNetworkImage(imageUrl: result["pic_url"])
                                //     : Text(""),
                                // result != null && result.isNotEmpty
                                //     ? JsonViewerWidget(result)
                                //     : Text("Sign in to get result")



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

// linkedInLogin() {
//
// }

