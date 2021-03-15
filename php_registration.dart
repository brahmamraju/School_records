import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class php_registartion extends StatefulWidget {
  @override
  _php_registartionState createState() => _php_registartionState();
}

class _php_registartionState extends State<php_registartion> {
    String id,email,password,password1;
    bool visible = false;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    Future userRegistration() async{
      // Showing CircularProgressIndicator.
      setState(() {
        visible = true ;
      });
      // Getting value from Controller

      String email = emailController.text;
      String password = passwordController.text;

if(email.length>0 && password.length>6 ) { // SERVER API URL
  var url = 'https://premarital-objectiv.000webhostapp.com';

  // Store all data with Param Name.
  var data = {'email': email, 'password': password};

  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));

  // Getting Server response into variable.
  print("------------------------------------------------");
  print(response.statusCode);
  print(response.toString());
  print("------------------------------------------------");
  //  var message = jsonDecode(response.body);


  print(response.body);
  print(response.statusCode);
  // If Web call Success than Hide the CircularProgressIndicator.
  print("------------------------------------------------");

  if (response.statusCode == 200) {
    setState(() {
      visible = false;
    });
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Registration Successful"),
        actions: <Widget>[
          FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

}
else{
  visible=false;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Email should not be empty and password length should be grater than 6"),
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

}// Showing Alert Dialog with Response JSON Message.
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Center(
                  child: Column(

                    children: <Widget>[


                      SizedBox(height: 240.0,),

                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('User Registration Form',
                              style: TextStyle(fontSize: 21))),



                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: emailController,
                            autocorrect: true,
                            decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                            validator:(value)
                            {
                              if(value.length==0){
                                return 'Enter email';
                              }
                              return null;
                            },
                          )
                      ),

                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: passwordController,
                            autocorrect: true,
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Enter Your Password Here'),

                          )
                      ),
                      SizedBox(height: 40.0,),
                      RaisedButton(
                        onPressed: userRegistration,
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Submit'),

                      ),

                      Visibility(
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator()
                          )
                      ),
                    ],
                  ),
                ))),
      );
    }

  validateEmail() {}
}
