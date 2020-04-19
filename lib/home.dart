import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Flexible(
               child: Hero(
                 tag: 'logo',
                 child: Image.asset(
                   'images/insta_logo.png',
                   width: 300.0,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
               child: Text(
                 'Welcome User',
                 style: TextStyle(
                   fontSize: 30.0,
                   fontWeight: FontWeight.w200,
                 ),
               ),
             ),
             MaterialButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               child: Text(
                 'Logout',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 15.0,
                 ),
               ),
               color: Colors.pink,
             ),
           ],
         ),
       ),
      ),
    );
  }
}
