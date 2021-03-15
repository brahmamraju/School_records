import 'package:brewcrew/Attendence1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Form.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {

  void initState() async
  {
      loading = false;
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:DefaultTabController(
        length :3,
        child:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.grey[850],
            bottom:TabBar(tabs :[
          Tab(icon:Icon(Icons.adb)),
              Tab(icon:Icon(Icons.account_balance)),
              Tab(icon:Icon(Icons.exit_to_app)),

            ])),
      body:TabBarView(
        children: [
          FillForm(),
          Attendence1(),

          Center(
            child: RaisedButton(
              child: Text("LogOut"),
              onPressed:  () async {
                FirebaseAuth.instance.signOut().then((onValue)
                {
                  loading=false;
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Home()),(Route<dynamic> route) => false);

                });
              },
            ),
          ),

        ],
      ),
      )
    ));
  }
}
