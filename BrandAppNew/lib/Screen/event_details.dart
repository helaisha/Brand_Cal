import 'package:firebase_authentication_tutorial/Screen/ProviderHelper/app_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ProviderHelper/event_firestore_services.dart';
import 'add_event.dart';

class EventDetails extends StatelessWidget {
  final AppEvent event ;

  const EventDetails({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: ()=> Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: (){
            //edit
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddEventPage(
                event : event
            )),);
          },),
          IconButton(icon: Icon(Icons.delete), onPressed:  ()async{
            final confirm = await showDialog(context: context, builder: (context)=>AlertDialog( title: Text("Warning!"),
            content: Text("Are you sure you want to delete ?"),
              actions: [
                TextButton(onPressed: ()=> Navigator.pop(context, true), child: Text("Delete"),),

                TextButton(onPressed: ()=> Navigator.pop(context, false), child: Text("Cancel", style: TextStyle(color: Colors.grey.shade700),),)

              ],
            ),) ?? false;
            if (confirm){
              // delete and pop
              await eventDBS.removeItem(event.id) ;
              Navigator.pop(context) ;
            }
          },),

        ],
        title: Text('title'),
      ),
      body:  ListView(
        padding:  const EdgeInsets.all(16.0),
        children: <Widget>[
        Text(event.reminder ? "Reminder Set" : "No Reminder Set"),
          ListTile(
            leading: Icon(Icons.event),
            title:  Text(event.title, style:  Theme.of(context).textTheme.headline5,),
            subtitle: Text(DateFormat("EEEE, dd MMMM, yyyy").format(event.date)),
          ),
          const SizedBox(height: 10.0,),
          if (event.description != null)
          ListTile(
            leading: Icon(Icons.short_text),
            title: Text(event.description),
          ),
          const SizedBox(height: 20.0,),

        ],
      ),

    );
  }
}
