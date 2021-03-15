import 'package:flutter/material.dart';
import 'main.dart';
import 'AuthService.dart';
import 'Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String id,email,password,password1;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          backgroundColor: Colors.grey[850],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 35.0,horizontal:25.0),
          child :Form(
            key  : _formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration:InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: ("Email"),
                ) ,

                validator:(value)
                {
                  if(value.length==0){
                    return 'enter email';
                  }
                  return null;
                },
                onChanged: (value){
                    setState(() {
                      email=value;
                    });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                decoration:InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: ("Password"),
                ) ,

                validator:(value)
                {
                  if(value.length<6){
                    return 'password length should be greater than 6';
                  }
                  return null;
                },

                onChanged: (value){
                    setState(() {
                      password=value;
                    });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration:InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: ("Re Enter Password"),
                ) ,

                obscureText: true,
                validator:(value)
                {
                  if(value!=password){
                    return 'does not match';
                  }
                  return null;
                },

                onChanged: (value){
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 20.0,),

              RaisedButton(
                child: Text('Sign Up'),
                onPressed:() async{
                  setState(() {
                    loading=true;
                  });
              if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmail(email, password);
                    setState(() {
                      loading = false;
                    });
                    if(result==null){
                      Fluttertoast.showToast(msg: 'Please Enter valid Email',
                          timeInSecForIos: 1,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.grey[500]
                      );

                      print('enter valid email');
                    }
                    else{
                      Fluttertoast.showToast(msg: 'Registered Successfully',
                          timeInSecForIos: 1,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.grey[500]
                      );
                      Navigator.pop(context);
                    }
              }
              else
                {
                  setState(() {
                    loading = false;
                  });
                }
                },
              )
            ],
          )
          )
        ),
      ),
    );
  }
}
