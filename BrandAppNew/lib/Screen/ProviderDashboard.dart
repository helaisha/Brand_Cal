import 'package:flutter/material.dart';
import '../Screen/ProviderHelper/ProviderState.dart';
import 'package:provider/provider.dart';

import 'ProviderLogin.dart';

class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${_providerState.getUid}"),
            Text("Email : ${_providerState.getEmail}"),
            RaisedButton(onPressed: (){
              //logout
              //controller.signout();
             // Signout(context);
              _providerState.signOut() ;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()) );
            },child: Text("Sign Out "),),

          ],
        ),
      ),
    );
  }
// }
//
// void Signout(context)  async{
//   ProviderState providerState =Provider.of<ProviderState>(context, listen: false) ;
//   try{
//     if(await providerState.signOut()){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()) );
//     }
//   }catch(e)
//   {
//
//   }

}
