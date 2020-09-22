import 'package:flutter/material.dart';
import 'package:glade_app/reusables/pills.dart';




class Personal extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return
        Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          key: UniqueKey(),

          children: <Widget>[
            Pills(
              image: "images/budget.png",
              text: "Budget",
              subText: "Set a limit to your spending",
            ),
            SizedBox(height: 20,),
            Pills(
              image: "images/savings.png",
              text: "Savings",
              subText:"Put away money  ",
            ),
            SizedBox(height: 20,),
            Pills(
              image: "images/personal.png",
              text: "Fund Personal Account",
              subText: "Fund your Account with just a click",
            ),

            SizedBox(height: 20,),


          ],
        );

//        Center(child: Text("Business Info", style: TextStyle(color: Colors.white.withOpacity(0.1)),)),
//        Center(child: Text("Business Info")),
//        Center(child: Text("hbhygygyg"))

  }
}