// import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:login_app/models/authentication.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
// import 'login.dart';
// import 'signup.dart';
import 'publishing.dart';
// import 'listening.dart';
// import 'analytics.dart';
// import 'calendar.dart';
import'Sch.dart';
import 'package:table_calendar/table_calendar.dart';
// import '../models/auth.dart';
import 'package:flutter/material.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import 'package:provider/provider.dart';
import 'event.dart';

import 'ProviderLogin.dart';


class Publishing extends StatefulWidget {



  static const routeName = '/Publishing';
  @override
  _PublishingState createState() => _PublishingState();
}

class _PublishingState extends State<Publishing> {

  @override




  Widget build(BuildContext context) {


    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
       // leadingWidth: screenSize.width,
        leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/strawberries.jpg'),
            radius: 20.0),
        title: Text('BRAND',
    style: TextStyle(
    fontSize: 10.0),
        ),
        actions: <Widget>[
          Container(

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //      Text ('Publishing',
                // style: TextStyle(
                //   fontSize: 24.0,
                //   fontStyle: FontStyle.italic,
                //   fontWeight: FontWeight.bold)
                //             ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //maintainState: true,
                            fullscreenDialog: false,
                            builder: (context) => Publishing()),
                      );
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.publish,
                          color: Colors.black,
                          size: 10,
                        ),
                        Text('PUBLISHING',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(width:3),
          Container(

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       //maintainState: true,
                      //       fullscreenDialog: false,
                      //       builder: (context) => Listening()),
                      // );
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.hearing,
                          color: Colors.black,
                          size: 10,
                        ),
                        Text('LISTENING',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(width:3),
          Container(
height: 15,
            child: Center(
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         //maintainState: true,
                    //         fullscreenDialog: false,
                    //         builder: (context) => analytics()),
                    //   );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.analytics,
                          color: Colors.black,
                          size: 10,
                        ),
                        Text('ANALYTICS',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
            Divider(),
            SizedBox(width:3),
            Container(

    child: Center(
    child:
          Text('| ELISHA', style: TextStyle(fontSize: 10.0)),

    )
    ),
          IconButton(
              icon: Icon(Icons.person_outline_rounded), onPressed: () {}),
        ],
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {

  return SingleChildScrollView(
    child: Column(children: <Widget>[
      SafeArea(
          child: Padding(
              padding: EdgeInsets.all(1.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.end,

                            children: <Widget>[


                         //  Divider(),

                         // _schedule(),
                              //_calendarfunc()
                          // //_calendar(),
                          //
                              Expanded(
                                flex: 50,
                                child: Container(
                                  child: socialmedia(),

                                  // color: Colors.lightBlue[400],
                                ),
                              ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              // Expanded(
                              //   flex: 30,
                              //   child: Container(
                              //     child: , // MyHomePage(),
                              //     // color: Colors.deepPurple[800],
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 3,
                              // ),
                              // Expanded(
                              //   flex: 30,
                              //   child: Container(
                              //     child: filters(),
                              //     // color: Colors.deepPurple[800],
                              //   ),
                              // ),
                            ])

                        // ])

                        //

                        ),
                  ])))]));

}

Widget _socialmedia(BuildContext context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const socialmedia(),
      Divider(),
    ],
  );
}

class socialmedia extends StatelessWidget {
  const socialmedia({
    Key key,
  }) : super(key: key);


  //Authentication().logIn(responseData);

  @override
  Widget build(BuildContext context) {
   // final user_id = AuthMethods().getCurrentUser();
   // print(user_id ) ;
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);

    return Container(
      //  width: 280.0,
      //           height: 400.0,
      //       color: Colors.red,
      //

      width: MediaQuery.of(context).size.width / 4,

      child: Column(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.add_circle_outline_rounded), onPressed: () {}),
          Container(

            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //      Text ('Publishing',
                // style: TextStyle(
                //   fontSize: 24.0,
                //   fontStyle: FontStyle.italic,
                //   fontWeight: FontWeight.bold)
                //             ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //maintainState: true,
                            fullscreenDialog: false,
                            builder: (context) => Event()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/photos/glasses-girl-in-white-picture-id1089633230?k=6&m=1089633230&s=612x612&w=0&h=FUHE3jCQMIrC72Ux8-rz_z3mHDi2UB61gceLSKAxEwg=',
                          ),
                          radius: 28.0,
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/images/facebook.png',
                            height: 10.0,
                            width: 10.0,
                              ),
                            ),
                          ]),
                        ),
                        Text('Jane Doe',
                            style: TextStyle(
                              fontSize: 7.0,
                              fontStyle: FontStyle.italic,
                              // fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(

            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //      Text ('Publishing',
                // style: TextStyle(
                //   fontSize: 24.0,
                //   fontStyle: FontStyle.italic,
                //   fontWeight: FontWeight.bold)
                //             ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //maintainState: true,
                            fullscreenDialog: false,
                            builder: (context) => Event()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/photos/glasses-girl-in-white-picture-id1089633230?k=6&m=1089633230&s=612x612&w=0&h=FUHE3jCQMIrC72Ux8-rz_z3mHDi2UB61gceLSKAxEwg=',
                          ),
                          radius: 28.0,
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/images/instagram.jpg',
                                height: 10.0,
                                width: 10.0,
                              ),
                            )
                          ]),
                        ),
                        Text('Jane Doe',
                            style: TextStyle(
                              fontSize: 7.0,
                              fontStyle: FontStyle.italic,
                              // fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
              decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //maintainState: true,
                            fullscreenDialog: false,
                            builder: (context) => Event()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/photos/glasses-girl-in-white-picture-id1089633230?k=6&m=1089633230&s=612x612&w=0&h=FUHE3jCQMIrC72Ux8-rz_z3mHDi2UB61gceLSKAxEwg=',
                          ),
                          radius: 28.0,
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/images/twitter.jpg',
                                height: 10.0,
                                width: 10.0,
                              ),
                            )
                          ]),
                        ),
                        Text('Jane Doe',
                            style: TextStyle(
                              fontSize: 7.0,
                              fontStyle: FontStyle.italic,
                              // fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Text(user_id.toString(),
          //     style: TextStyle(
          //       fontSize: 7.0,
          //       fontStyle: FontStyle.italic,
          //       // fontWeight: FontWeight.bold
          //     )),
    // FutureBuilder<Authentication>(
    // future: userinfo,
    // builder: (context, snapshot) {
    // if (snapshot.hasData) {
    // return Text(snapshot.data.email);
    // } else if (snapshot.hasError) {
    // return Text("${snapshot.error}");
    // }
    //
    // // By default, show a loading spinner.
    // return CircularProgressIndicator();
    // },
    // );

          Text("UID: ${_providerState.getUid}"),
          Text("Email : ${_providerState.getEmail}"),

        ],
      ),
    );
  }
}

Column _schedule() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const schedule(),
      Divider(),
    ],
  );
}

class schedule extends StatelessWidget {
  const schedule({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 280.0,
      //           height: 400.0,
      // color: Colors.red,
      //
      width: MediaQuery.of(context).size.width / 2,

      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Click to share or schedule',
              labelText: 'Click to share or schedule',
            ),
          ),
          Divider(),
          _calendarfunc()
        ],
      ),
    );
  }
}

Column _calendarfunc() {
  return Column(
    children: <Widget>[
      cal(),
    ],
  );
}

class cal extends StatelessWidget {
  cal({
    Key key,
  }) : super(key: key);
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).copyWith().size.height / 2,
        width: MediaQuery.of(context).copyWith().size.width / 3,
        child: TableCalendar(
          calendarController: _controller,

          //   calendarStyle:
          //   CalendarStyle(
          // BoxDecoration contentDecoration: const BoxDecoration(final double rowHeight :23),
        ));
  }
}
