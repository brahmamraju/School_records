import 'Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'AuthService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Loading.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:io';
import 'globals.dart' as globals;

class Attendence1 extends StatefulWidget {
  @override
  _Attendence1State createState() => _Attendence1State();
}


class _Attendence1State extends State<Attendence1> {
  bool loading = false;
  var students = new List(4);
  Future requestData(grade) async
  {
    var url = 'https://premarital-objectiv.000webhostapp.com/student_data.php';

    // Store all data with Param Name.
    var data = {'grade': grade};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var message= jsonDecode(response.body);
 //   var reg_no=message['Register_no'];
    print("---------------------------");
 //   print(message);
    print(globals.isLoggedin);

  //  await Future.delayed(Duration(seconds: 15));
    return message;
  }
  Future updateAttendance(regno,val) async
  {
    var url = 'https://premarital-objectiv.000webhostapp.com/attendance.php';
    var att;
    if(val){
       att=1;
    }
    else{
       att =0;
    }
    // Store all data with Param Name.
    var dt=new DateTime.now();
    var date=dt.toString();
    print(date.substring(0,11));
    var data = {'id':regno,'date':date.substring(0,11),'subject':'telugu','attendance':att};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var message= jsonDecode(response.body);
    print("---------------------------");
    print(message);
    print("------------------------");
  }

  List <bool> isSwitched =[true,true,true,true];
  void requestDataFunction() async
  {
    var a = await requestData("1");
    var i=0;
    globals.isLoggedin=true;
    print(a);
    while(i<a.length) {
      globals.regnos[i] = a[i]['Register_no'];
      globals.names[i]=a[i]['Student_Name'];
      i=i+1;
    }
    print(globals.regnos);
  }
  void update(bool value) {

    if(isSwitched == false)
    {
      setState(() {
      //  isSwitched = true;
    //    textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        //isSwitched = false;
      //  textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }


  @override
  Widget build(BuildContext context) {
    requestDataFunction();
    void populate() {
    for (var i in globals.regnos)
      updateAttendance(i, isSwitched[int.parse(i) - 1]);
  }
  populate();


    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Student Attendance"),
      ),
      body: Container(
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (var i in globals.names) Text(i.toString()),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (var i in globals.regnos)

                  Switch(
                  value: isSwitched[int.parse(i)-1],
                  activeColor: Colors.green,
                  activeTrackColor: Colors.greenAccent,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                    onChanged: (value)
                    {
                      updateAttendance(i,isSwitched[int.parse(i)-1]);
                      setState(() {
                        isSwitched[int.parse(i)-1]=value;
                      });
                    },
                  )
                  ])
    ]
    )
            ),

        );
  }
}