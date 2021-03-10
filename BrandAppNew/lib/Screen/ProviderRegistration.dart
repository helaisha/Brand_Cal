import 'package:flutter/material.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import '../Screen/ProviderLogin.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Screen/ProviderDashboard.dart';
class ProviderRegistration extends StatefulWidget {
  @override
  _ProviderRegistrationState createState() => _ProviderRegistrationState();
}

class _ProviderRegistrationState extends State<ProviderRegistration> {
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void _signUp(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.signUpUser(email, password)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()));
      }
    }catch(e)
    {
      print(e);
    }

  }
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //     height: 100,
                      //     width: 100,
                      //     child: SvgPicture.asset("images/assets/xing.svg")),
                      HeightBox(10),
                      "Registration".text.color(Colors.black).size(20).make(),
                      HeightBox(
                          20
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: firstn,
                          decoration: InputDecoration(
                            hintText: 'First Name',
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
                      HeightBox(
                          20
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: lastn,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
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
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      HeightBox(
                          20
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: password,
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
                      GestureDetector(
                          onTap:(){
                            final close = context.showLoading(msg: "Loading");
                            Future.delayed(4.seconds, close); // Removes toast after 2 seconds
                             RegisterUser(email.text,password.text,context);

                            _signUp(email.text, password.text, context);
                          },
                          child: "Sign-Up".text.white.light.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(150).h(40)),
                      HeightBox(140),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration( color: Colors.lightBlueAccent),

            child:
        GestureDetector(



          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
        ));
  }

  void RegisterUser(String email, String password, context)  async{
    ProviderState providerState =Provider.of<ProviderState>(context, listen: false) ;
        try{
        if(await providerState.signUpUser(email,password)){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()) );
        }
        }catch(e)
    {

    }

  }
}
