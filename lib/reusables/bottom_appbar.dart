import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';



class BottomAppBar2 extends StatefulWidget with PreferredSizeWidget {
  final Function onPredictionResponse;
  final Function onTap;
  final Function setDestinationText;

  BottomAppBar2({Key key, this.onPredictionResponse, this.setDestinationText, this.onTap}) : super(key: key);

  @override
  _BottomAppBar2State createState() => _BottomAppBar2State();

  @override
  Size get preferredSize => Size.fromHeight(250);
}

class _BottomAppBar2State extends State<BottomAppBar2> with AfterLayoutMixin<BottomAppBar2> {

  TextEditingController pickController = TextEditingController();
  TextEditingController destController = TextEditingController();
  Timer _timer;
  Timer _timer2;
  var previousText;



  @override
  void afterFirstLayout(BuildContext context) {
    //pickController.text = _appState.currentAddress.description;

//    pickController.addListener(onChange);
//    destController.addListener(onChange2);

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(

          image: DecorationImage(fit: BoxFit.cover,
              image: AssetImage("images/background.png", )
          )
      ),

      height: 250,

      width: double.infinity,


    );
  }



}
