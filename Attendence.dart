import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';


class Attendence extends StatefulWidget {
  @override
  _AttendenceState createState() => _AttendenceState();
}
class Students{
  String id;
  String subject;
  String att;
  Students(
  {
    this.id,
    this.subject,
    this.att,
});

}
class _AttendenceState extends State<Attendence>{
  bool add=true;
  List<Students> _i=<Students>[
    Students(id:'y16it847'),
    Students(id:'y16it848'),
    Students(id:'y16it849'),
    Students(id:'y16it848'),
  ];
  List <Widget> students =[];
  String _dropDownValue;
  void addtolist()
  {
    if(add)
    {
      students.add(
          DropdownButton(
          hint: _dropDownValue == null
          ? Text('Select Subject')
        : Text(
            _dropDownValue,
            style: TextStyle(color: Colors.blue),
              ),
          isExpanded: true,
          iconSize: 30.0,
          onChanged: (String newValue){
            setState(() {
              _dropDownValue=newValue;
             });
          },
          style: TextStyle(color: Colors.blue),
          items: <String>['One', 'Two', 'Three'].map<DropdownMenuItem<String>>(
          (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList()));

      for (int i=0;i<_i.length;i++){
        students.add(SizedBox(height: 10.0,));
        students.add(
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(width: 15.0,),
            Text(_i[i].id.toUpperCase()),
                SizedBox(width: 130,),
                ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20,
                    activeBgColor: Colors.green,
                    activeTextColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveTextColor: Colors.white,
                    labels: ['present', 'absent'],
                    activeColors: [Colors.green,Colors.red],
                    onToggle: (index) {
                      setState(() {
                        if(index==0){
                          _i[i].att="P";
                        }
                        else
                          {
                            _i[i].att="A";
                          }
                        _i[i].subject=_dropDownValue;
                      });
                      print('switched to: $index');
                    }
                    ),

              ],
            ),
          )
        );
        students.add(Divider(color: Colors.black,));
      }
    }
    add=false;
  }
  @override
  Widget build(BuildContext context) {

    addtolist();
    print(_i[0].subject);
    return Container(
      child: ListView(
        children: students,
      ),
    );
  }
}