
// import 'package:calendar_flutter_app/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication_tutorial/Screen/constants.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'ProviderHelper/ProviderState.dart';
import 'add_event.dart';
// import 'routes.dart';
import 'event.dart';
import 'ProviderHelper/app_event.dart';
import 'ProviderHelper/event_firestore_services.dart';


import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

import 'event_details.dart';
// import 'package:firebasestarter/core/presentation/res/routes.dart';
// import 'package:firebasestarter/features/notification/data/service/push_notification_service.dart';

class Event extends StatefulWidget {
  @override
  _Event createState() => _Event();
}

class _Event extends State<Event> {
  // @override
  // void didChangeDependencies() {//   Provider.of<PushNotificationService>(context).init();//   super.didChangeDependencies();// }
  Map<DateTime, List<AppEvent>> _groupedEvents ;
  CalendarController _calendarController = CalendarController();
  DateTime variableDate;

  // @override

  _groupEvents(List<AppEvent> events) {
    _groupedEvents = {} ;
    events.forEach((event){
      DateTime date =  DateTime.utc(event.date.year, event.date.month, event.date.day, 12);
      if(_groupedEvents[date]==null) _groupedEvents[date] = [] ;
      _groupedEvents[date].add(event);

    }) ;
  }
  @override
  Widget build(BuildContext context) {
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase starter'),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.person),
          //   // onPressed: () => Navigator.pushNamed(),context, AppRoutes.profile),
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: eventDBS.streamQueryList(
              args: [
                QueryArgsV2("user",
                    isEqualTo:
                    _providerState.getUid),
              ]
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
            if (snapshot.hasData) {
              final events = snapshot.data;
              _groupEvents(events);
              DateTime selectedDate = _calendarController.selectedDay;
              final _selectedEvents = _groupedEvents[selectedDate] ?? [] ;
              return Column(
                crossAxisAlignment : CrossAxisAlignment.start ,
                children: [
                  Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.all(8.0),
                      child: TableCalendar(
                        calendarController: _calendarController,
                        events : _groupedEvents ,
                        onDaySelected : (date, events, holidays) {
                          setState(() {

                          });
                        },
                        weekendDays :[6],
                        headerStyle: HeaderStyle(decoration: BoxDecoration(
                          color: kPrimaryColor,
                        ),
                          headerMargin : const EdgeInsets.only(bottom: 8.0),
                          titleTextStyle: TextStyle(color: Colors.white),
                          formatButtonDecoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          formatButtonTextStyle: TextStyle(color: Colors.white),
                        ),


                      )),
            //       Padding(
            //         padding : const EdgeInsets.only(left :50.0, top :8.0),
            //         child :
            //
            //
            //
            //         Text(DateFormat('EEEE, d MMMM, yyyy').format(selectedDate), style : Theme.of(context).textTheme.headline6,
            // ),
            //       ),
// Container(
//                 // child:
//     // if(selectedDate == null){
//     //                 return null
//     //               } else {
//     //         Text(DateFormat('EEEE, d MMMM, yyyy').format(selectedDate), style : Theme.of(context).textTheme.headline6,
//     //               },
//
//
//             child: Builder(
//             builder: (context) {
//             // any logic needed...
//             final condition = _whateverLogicNeeded();
//
//             return condition
//             ? Container();
//                 : Center();
//             }
//             )
//             ),

                  if (selectedDate == null) ...[
            Padding(
            padding : const EdgeInsets.only(left :50.0, top :8.0),
            child :
            Text(DateFormat('EEEE, d MMMM, yyyy').format(DateTime.now()),style : Theme.of(context).textTheme.headline6,),
            ),
                  ] else if(selectedDate !=null)...[
                          Padding(
                            padding : const EdgeInsets.only(left :50.0, top :8.0),
                            child :
                            Text(DateFormat('EEEE, d MMMM, yyyy').format(selectedDate), style : Theme.of(context).textTheme.headline6,
                    ),
                          ),
                  ],

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount : _selectedEvents.length,
                    itemBuilder : (BuildContext context, int index){

                      AppEvent event = _selectedEvents[index] ;
                      return ListTile(title: Text(event.title),
                        subtitle: Text(DateFormat("EEEE, d MMMM, yyyy").format(event.date)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> EventDetails(
                              event : event
                          )),);

                        },
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddEventPage(
                              event : event
                          )),),
                        ),

                      );
                      // ignore: missing_return
                    },
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),

      ),





      //
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddEventPage(
              selectedDate:_calendarController.selectedDay
          )),);
          // Navigator.pushNamed(context, AppRoutes.addEvent) ;

        },
      ),
    );
  }
}
