
import 'package:flutter/material.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/screens/fundTransfer.dart';

class PersonalNavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

//      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueGrey,
      selectedIconTheme: IconThemeData(color:Colors.blueGrey ),
      unselectedItemColor: Colors.blueGrey ,
      unselectedIconTheme: IconThemeData(color:Colors.blueGrey ),

      iconSize: 30.0,
//      onTap: (int index){
//        setState(() {
//          _selectedIndex = index;
//        });
//      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset("images/bankmoney.png"),
          activeIcon:Image.asset("images/glade.png"),

          title: Text('Home',),
        ),

        BottomNavigationBarItem(

          icon: InkWell(
              onTap: (){
                Navigator.push(context, FadeRoute(page: Fund()));
              },
              child: Image.asset("images/bankmoney.png")),
          activeIcon:Image.asset("images/bankmoney.png"),

          title: Text('Fund Transfer',style: TextStyle(color: Colors.black),),
        ),

        BottomNavigationBarItem(

          icon: InkWell(
              onTap: (){
                Navigator.push(context, FadeRoute(page: Fund()));
              },
              child: Image.asset("images/bankmoney.png")),
          activeIcon:Image.asset("images/bankmoney.png"),

          title: Text('Fund Transfer',style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(

          icon: InkWell(
              onTap: (){
                Navigator.push(context, FadeRoute(page: Fund()));
              },
              child: Image.asset("images/bankmoney.png")),
          activeIcon:Image.asset("images/bankmoney.png"),

          title: Text('Fund Transfer',style: TextStyle(color: Colors.black),),
        ),










      ],

    );
  }
}