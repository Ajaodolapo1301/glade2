
import 'package:flutter/material.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/screens/fundTransfer.dart';



class BusinessNav extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
//      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueGrey,
      selectedIconTheme: IconThemeData(color:Colors.blueGrey ),


      iconSize: 30.0,
//      onTap: (int index){
//        setState(() {
//          _selectedIndex = index;
//        });
//      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset("images/bankmoney.png"),
          activeIcon:Image.asset("images/bankmoney.png"),

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

          title: Text('Loan',style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(

          icon: InkWell(
              onTap: (){
                Navigator.push(context, FadeRoute(page: Fund()));
              },
              child: Image.asset("images/bankmoney.png")),
          activeIcon:Image.asset("images/bankmoney.png"),

          title: Text('Invoice',style: TextStyle(color: Colors.black),),
        ),
        BottomNavigationBarItem(

          icon: InkWell(
              onTap: (){
                Navigator.push(context, FadeRoute(page: Fund()));
              },
              child: Image.asset("images/bankmoney.png")),
          activeIcon:Image.asset("images/bankmoney.png"),

          title: Text('Cards',style: TextStyle(color: Colors.black),),
        ),







//        BottomNavigationBarItem(
//          icon: SvgPicture.asset("images/election.svg", width: 30, color: Color(0xff707070)),
//          activeIcon:  SvgPicture.asset("images/election.svg", width: 30, color:Color(0xffDEC489)),
//          title: Text('Vote', style: TextStyle(fontSize: 15)),
//        ),
//        BottomNavigationBarItem(
//          icon: SvgPicture.asset("images/download.svg", width: 30, color: Color(0xff707070)),
//          activeIcon:SvgPicture.asset("images/download.svg", width: 30,color:Color(0xffDEC489)),
//          title: Text('Dream Feed', style: TextStyle(fontSize: 15, color: Color(0xffDEC489))),
//        ),
//        BottomNavigationBarItem(
//          icon: SvgPicture.asset("images/user.svg",  width: 25, color: Color(0xff707070)),
//          activeIcon: SvgPicture.asset("images/user.svg", width: 25,  color: Color(0xffDEC489)) ,
//          title: Text('Profile'),
//        ),
//        BottomNavigationBarItem(
//          icon: SvgPicture.asset("images/settings.svg",color: Color(0xff707070),  width: 25),
//
//          activeIcon: SvgPicture.asset("images/settings.svg",color: Color(0xffDEC489),  width: 25),
//          title: Text('Settings'),
//        ),

      ],

    );
  }
}