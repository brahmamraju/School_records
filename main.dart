import 'package:brewcrew/php_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'AuthService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Loading.dart';
FirebaseUser user;
void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool loading = false;

class _HomeState extends State<Home> {

  String _email,_password;
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth =AuthService();
  Future userSignin(String email,String password) async
  {
    var url = 'https://premarital-objectiv.000webhostapp.com/signin.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var message= jsonDecode(response.body);
    setState(() {
      loading=false;
    });
    print("--------------------------");
    print(message);
    if( message=='false')
    {
      setState(() {
        loading=false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Email or Password incorrect"),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print(message);

    }
    else{
      print(message);
      print('---------------;sds');
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomeScreen()),(Route<dynamic> route) => false);

    }
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title:Text("Login"),
        backgroundColor: Colors.grey[850],
        actions: <Widget>[
          FlatButton(
            child: Text("New User Register"
            ,style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>php_registartion()));
            },
          )

        ],
      ),
        body : SafeArea(
            child: Center(
              child: Container(
                width :370,
                height :300,
    child :SingleChildScrollView(
        child: Form(
                key  : _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                children :<Widget>[
                Text('Email',
                    textAlign: TextAlign.start,
                    style:TextStyle(
                      color : Colors.grey,
                      letterSpacing: 2.0,

                    ) ,),]
                    ),
              SizedBox(height: 10.0,),
                      TextFormField(
                        style: TextStyle(
                            color:Colors.grey,
                        ),
                        validator:(value)
                        {
                          if(value.length==0){
                            return 'Enter email';
                          }
                          return null;
                        },

                        decoration:InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[850],
                          isDense: true,
                              border: OutlineInputBorder(),
                          hintText: ("Enter Email"),

                        ) ,
                        onChanged: (value){
                          this.setState((){
                            _email=value;
                          });
                        },
                      ),
                    SizedBox(height: 20.0,),
                    Row(
                      children :<Widget>[
                    Text('Password',
                      textAlign: TextAlign.end,
                      style:TextStyle(
                        color : Colors.grey,
                        letterSpacing: 2.0,
                      ) ,),]),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(
                        color:Colors.grey
                      ),
                      obscureText: true,
                      validator:(value)
                      {
                        if(value.length==0){
                          return 'Enter Password';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      decoration:InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[850],
                          hintText: ("Enter Password"),
                          isDense: true,
                          border: OutlineInputBorder()
                      ) ,
                      onChanged: (value){
                        this.setState((){
                          _password=value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0,),
                    RaisedButton(
                      child:Text("SignIn"),
                      onPressed: () async {
           if(_formKey.currentState.validate()) {
             setState(()  {
               loading = true;
             });
             userSignin(_email, _password);
           }
           },
                    ),
                    SizedBox(height: 10.0,),

                  ],
                ))),
              ),
            ),

        )
    );
  }
}
