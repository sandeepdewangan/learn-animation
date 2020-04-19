import 'package:flutter/material.dart';

import 'home.dart';
/*
Pre-packaged Animation
-------------------------
Use flutter dev packages -> animated_text_kit

HERO Animation
-------------------------
Screen transitions if shared element exists.

Logo is animated with simple Hero Animation.
Just we have to wrap with Hero and give it a shared tag name.

Custom Animation
-------------------------
Ex. Calender Icon.
For custom animation we need 3 things:
I. Ticker
II. Controller
III. Value (which changes)
IV. Dispose controller

Curve Animation
-------------------------
To customized the animation value. (always bound from 0 and 1)
1. Animation class)

Tween Animation
-------------------------
See docs

Looping Animation
-------------------------
controller.forward()
animation.addStatusListener((status){
  if(status == AnimationStatus.completed){ // AnimationStatus.dismissed
    controller.reverse(from....)
   }
 });

Flexible Widget
-------------------------
A Flexible widget must be a descendant of a Row, Column, or Flex.
If you have image in the screen and you want image to shrink wrap it with flexible widget.

Mixin
-------------------------
Way of reusing class cod in multiple class heirarchy.
eg. class Animal{}
mixin Fish{}
mixin Bird{}

class Duck extends Animal with Fish, Bird{}
 */

void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: AnimationApp(),
      ),
    ),
  );
}

class AnimationApp extends StatefulWidget {
  @override
  _AnimationAppState createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> with SingleTickerProviderStateMixin{

  // II Controller
  AnimationController controller;
  Animation aniamtion;

  @override
  void initState() {
    controller = AnimationController(
                    duration: Duration(seconds: 2),
                    vsync: this,
                    //upperBound: we can use to customize value
                  );
    aniamtion = CurvedAnimation(
        parent: controller,
      curve: Curves.easeOutCubic
    );
    controller.forward();
    controller.addListener((){
      setState(() {
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                  'images/insta_logo.png',
                width: 150.0,
              ),
            ),
          ),
          Flexible(
            child: Icon(
              Icons.insert_invitation,
              color: Colors.pink.withOpacity(controller.value),
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 5.0),
            child: TextField(
              onChanged: (val){},
              decoration: InputDecoration(
                hintText: 'Enter Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 30.0),
            child: TextField(
              onChanged: (val){},
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home() ));
            },
            child: Text(
                'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
