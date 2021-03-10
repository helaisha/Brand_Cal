// import '../../Screen/ProviderHelper/event_firestore_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:date_format/date_format.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/Screen/ProviderHelper/event_firestore_services.dart';
import 'package:firebase_authentication_tutorial/Screen/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import 'package:provider/provider.dart';
import 'package:time_machine/time_machine.dart';

import 'ProviderHelper/app_event.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl/intl.dart';
// // import 'routes.dart';
// import '../Screen/ProviderHelper/data_constants.dart';
// import '../../Screen/ProviderHelper/event_firestore_services.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_database/firebase_database.dart';
// import '../../Screen/ProviderHelper/app_event.dart';
// import '../../Screen/ProviderHelper/data_constants.dart';
// import '../../Screen/ProviderHelper/event_firestore_services.dart';

class AddEventPage extends StatefulWidget {
  final DateTime selectedDate ;
  final AppEvent event ;
  const AddEventPage({Key key, this.selectedDate, this.event}) : super(key: key);
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
       backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [Center(
          child: ElevatedButton(
            onPressed: ()async{
              // save event
              bool validated = _formKey.currentState.validate();

              if(validated){
                _formKey.currentState.save();
                final data = Map<String, dynamic>.from(_formKey.currentState.value);
                data['date'] = (data['date'] as DateTime).millisecondsSinceEpoch ;
                if (widget.event == null){
                  data['user'] = _providerState.getUid;
                  print(data);
                  await eventDBS.create(data) ;

                }else{
                  //edit and update
                  await eventDBS.updateData(widget.event.id, data) ;

                }

                Navigator.pop(context);
              };
            },
            child: Text('Save'),
          ),
        )],

      ),
      body: ListView(
        padding:  const EdgeInsets.all(16.0),
        children:<Widget> [
          FormBuilder(
            key: _formKey,
            child: Column(
            children: [
              FormBuilderTextField(name: 'title',
              initialValue: widget.event?.title,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
              decoration: InputDecoration(
                hintText: "Add Title",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 48.0),
              ),),
              Divider(),
              FormBuilderTextField(name: "description",
              initialValue: widget.event?.description,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                border:  InputBorder.none,
                hintText: "Add Post",
                prefixIcon: Icon(Icons.short_text),
              ),),

              Divider(),

              FormBuilderSwitch( name: 'reminder', title: Text('Set Reminder'),
                initialValue: widget.event?.reminder ?? false,
                controlAffinity: ListTileControlAffinity.leading,
              decoration: InputDecoration(border: InputBorder.none),),
              Divider(),

              FormBuilderDateTimePicker(
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                name: "date",
                initialValue: widget.event != null ? widget.event.date: widget.selectedDate ??
                DateTime.now(),
              fieldHintText: "Add Date",
                inputType: InputType.date,
                format: DateFormat('EEEE , dd MMMM, yyyy'),
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_today_sharp),
                ),
              ),




        ],
      ),


    )]));
  }

  // DateFormat(String s) {DateFormat('EEE, M/d/y');}
}
