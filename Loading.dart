import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:Scaffold(
          body: Container(
            color: Colors.grey,
            child:Center(

                child: LoadingBouncingGrid.circle(
                    borderColor:Colors.black,
                    backgroundColor: Colors.grey,
                    size : 70.0
                )),

          )),
    );
  }
}
