

import 'package:flutter/material.dart';
import 'package:glade_app/constants/colorConstants.dart';



class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
//          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight:  Radius.circular(15))
    ),
            
            height: 250,
//                 height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,

            child: Padding(
              padding:  EdgeInsets.all(20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
//                                _logOut(context);
                        },
                        child: Container(
                            child:
                           Icon(Icons.clear_all)),
                      ),
                      Icon(Icons.notifications)

                    ],
                  ),



                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15)  )
            ),
            height: 100,
          )
        ],
      ),

    );
  }
}