import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication_tutorial/Screen/publishing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../GetXHelper/FirebaseController.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import '../Screen/ProviderDashboard.dart';
import '../Screen/ProviderRegistration.dart';
// import '../Screen/Dashboard.dart';
// import '../Screen/ForgotPassword.dart';
// import '../Screen/RegistrationPage.dart';
import '../Widgets/SocialSignWidgetRow.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';


class ProviderLogin extends StatefulWidget {
  @override
  _ProviderLoginState createState() => _ProviderLoginState();
}

class _ProviderLoginState extends State<ProviderLogin> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                padding: const EdgeInsets.fromLTRB(20,40 , 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //     height: 100,
                    //     width: 100,
                    //     child: SvgPicture.asset("images/assets/xing.svg")),
                    HeightBox(10),
                    "Login".text.color(Colors.black).size(20).make(),
                    HeightBox(
                        20
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[400]
                              )
                          ),
                          isDense: true,                      // Added this
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    HeightBox(
                        20
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: pass,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[400]
                              )
                          ),
                          isDense: true,                      // Added this
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    HeightBox(20),

                    GestureDetector(onTap: (){
                     // Get.to(ForgotPassword());
                    },
                      child: Text("Forgot Password ? Reset Now",style: TextStyle(color: Colors.black),),),

                    HeightBox(10),
                    GestureDetector(
                        onTap: (){
                          print("Login Clicked Event");
                          _Login(email.text, pass.text, context);
                        },
                        child: "Login".text.white.light.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(150).h(40)),
                    HeightBox(20),



                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar:Container(
    decoration: BoxDecoration( color: Colors.lightBlueAccent),

    child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderRegistration()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
        ) );
  }
  void _Login(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.LoginUser(email, password)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Publishing()));
      }
    }catch(e)
    {
      print(e);
    }

  }
}