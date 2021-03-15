import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class FillForm extends StatefulWidget {
  @override
  _FillFormState createState() => _FillFormState();
}
bool visible;
class _FillFormState extends State<FillForm> {
  String _name,_class,_telugu,_english,_hindi,_science,_social,_mathematics,_examname;
  String _telugumax,_socialmax,_sciencemax,_englishmax,_mathematicsmax,_hindimax;
  String _dropDownValue;
  Future savedata(_name,_class,_telugu,_english,_hindi,_science,_social,_mathematics,_examname) async
  {
    var url='https://premarital-objectiv.000webhostapp.com/marks.php';
    var i;
    var j=0;
    var marks=[_telugu,_english,_mathematics,_science,_social,_hindi];
    var subjects = ["telugu","english","maths","science","social","hindi"];
    for(i in subjects)
      {
        var data={'id':_name,'subject': i,'mo':int.parse(marks[j]),'mm':100};
        var response = await http.post(url,body:json.encode(data));
        var message =jsonDecode(response.body);
        print(marks[j]);
        print(i);
        print(message);
        j=j+1;
      }
    var data={'id':_name,'subject': "telugu",'mo':int.parse(_telugu),'mm':100};
    var response = await http.post(url,body:json.encode(data));
    var message =jsonDecode(response.body);
    if(response.statusCode==200)
    {
      setState(() {
        visible=false;
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
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
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 35.0,horizontal:25.0),
      child :SingleChildScrollView(
      child : Form(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          DropdownButton(
            hint: _dropDownValue == null
                ? Text('Select Student')
                : Text(
              _dropDownValue,
              style: TextStyle(color: Colors.blue),
            ),
            isExpanded: true,
            iconSize: 30.0,
            style: TextStyle(color: Colors.blue),
            items: ['One', 'Two', 'Three'].map(
                  (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                    () {
                  _name = val;
                },
              );
            },
          ),

          Row(
            children: <Widget>[
              Text("Subject"),
              SizedBox(width: 40 ,),
              Text("Marks Obtained"),
              SizedBox(width: 20,),
              Text("Maximum Marks")
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[

              Flexible(
                flex:2,
              child: Text("Telugu")),
              Flexible(
                  flex:1,
                  child:SizedBox(width: 50,)),
            Flexible(
              flex:2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _telugu=value;
                    });
                    },
                ),
            ),
          Flexible(
            flex:1,
            child:SizedBox(width: 50,),
          ),
              Flexible(
                flex:2,

                child: TextFormField(
                  initialValue: '100',
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _telugumax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),

          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              Flexible(
                flex:2,
                  child: Text("English")),
              Flexible(
                flex:1,
                child:SizedBox(width: 50,),
              ),
              Flexible(
                flex:2,
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _english=value;
                    });
                  },
                ),
              ),
              Flexible(
                flex:1,
                child:SizedBox(width: 50,),
              ),

              Flexible(
                flex:2,
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  initialValue: '100',
                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _englishmax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              Flexible(
                flex:2,
                  child: Text("Hindi")),
              Flexible(
                flex:1,
                child:SizedBox(width: 50,),
              ),
              Flexible(
                flex:2,
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _hindi=value;
                    });
                  },
                ),
              ),
              Flexible(
                flex:1,
                child:SizedBox(width: 50,),
              ),

              Flexible(
                flex:2,
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  initialValue: '100',
                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _hindimax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              Flexible(
                  child: Text("Mathematics")),
              SizedBox(width: 20,),

              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _mathematics=value;
                    });
                  },
                ),
              ),
              SizedBox(width: 50,),

              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  initialValue: '100',
                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _mathematicsmax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                  child: Text("Science")),
              SizedBox(width: 45,),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _science=value;
                    });
                  },
                ),
              ),
              SizedBox(width: 50,),

              Flexible(
                child: TextFormField(
                  initialValue: '100',
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _sciencemax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              Flexible(
                  child: Text("Social")),
              SizedBox(width: 55,),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Marks"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _social=value;
                    });
                  },
                ),
              ),
              SizedBox(width: 50,),

              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  initialValue: '100',
                  decoration:InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: ("Name"),
                  ) ,
                  onChanged: (value){
                    this.setState((){
                      _socialmax=value;
                    });
                  },
                ),
              )

            ],
          ),
          SizedBox(height: 15.0),
          RaisedButton(
            child:Text('Submit'),
            onPressed: (){
				savedata(_name,_class,_telugu,_english,_hindi,_science,_social,_mathematics,_examname);
            },
          )
        ],
      ))),

    );
  }
}
