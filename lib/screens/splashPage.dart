import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'home.dart';


class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin<SplashPage>{




  @override
  void initState() {

    super.initState();

    Timer(Duration(seconds: 5,) , ()=>   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage())));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),

          Center(
            child: Container(
                height: 300,
                width: 300,
                child: Image.asset('images/gladeSplash.png')),
          ),

        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }
}


