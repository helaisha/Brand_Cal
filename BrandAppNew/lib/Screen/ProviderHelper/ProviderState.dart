import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:http/http.dart' as http ;

class ProviderState extends ChangeNotifier{

  String _uid;
  String _email;
  String _token;
  String _name;
  String _secret;


  String get getUid =>_uid;
  String get getEmail => _email;
  String get getToken => _token;
  String get getName => _name;
  String get getSecret => _secret;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email,String password) async{
    bool retval = false;

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if(userCredential.user != null)
      {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        _name = userCredential.user.displayName;
        return retval = true;
      }
    }catch(e)
    {
      print(e);
    }

    return retval;
  }

  Future<bool> LoginUser(String email,String password) async{
    bool retval = false;

    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(userCredential.user != null)
      {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        _name = userCredential.user.displayName;
        return retval = true;
      }
    }catch(e)
    {
      print(e);
    }

    return retval;
  }

  Future<bool> signInfacebook() async {
    bool retval = false;

    try {
      FacebookLogin facebookLogin = FacebookLogin();

      final result = await facebookLogin.logIn(['email']);
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=${token}');
      print(graphResponse.body);
      if (result.status == FacebookLoginStatus.loggedIn) {
        final credential = FacebookAuthProvider.credential(token);
      // final holder =
      _auth.signInWithCredential(credential);
        _token = token ;

        return retval = true;

        print(result) ;
      }
  }catch(e)
  {
  print(e);
  }
  return retval;
  }


  Future<bool> signInTwitter() async {
    bool retval = false;

    try {

    var twitterLogin = new TwitterLogin(
      consumerKey: 'mzlj5A21bXz6qxeX9go6iQaKP',
      consumerSecret: 'CCCITbAcpwPvdpNke47F7FC3J9Wu6z8TFYFYvE9NbdrdtIGkST',
    );

    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        _token = session.token ;
        _secret = session.secret ;
        print(session.username);
        print(session.userId);
        print(result);
        return retval = true;


        // AuthCredential _authCredential = TwitterAuthProvider.getCredential(
        //     authToken: _currentUserTwitterSession?.token ?? '',
        //     authTokenSecret: _currentUserTwitterSession?.secret ?? ''
        // );
        // _currentUser = await _firebaseAuth.signInWithCredential(
        //     _authCredential
        // );

        //  _sendTokenAndSecretToServer(session.token, session.secret);
        break;
      case TwitterLoginStatus.cancelledByUser:
      // _showCancelMessage();
        print('cancelled by user') ;
        return retval = false;
        break;
      case TwitterLoginStatus.error:
        print(result.errorMessage);
        break;
        print(result) ;
    }
    }catch(e)
    {
      print(e);
    }
    return retval;
  }




 void signOut() async {
    await _auth.signOut();
  }
}