


import 'package:flutter/material.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/constants/colorConstants.dart';
import 'package:glade_app/reusables/personals.dart';
import 'package:glade_app/reusables/businessNav.dart';
import 'package:glade_app/reusables/business.dart';
import 'package:glade_app/reusables/personalNav.dart';

import 'package:glade_app/screens/fundTransfer.dart';
import 'package:glade_app/screens/profile.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';



class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>    with SingleTickerProviderStateMixin{
  TabController _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSwitched = false;
  bool isClicked =  false;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
      Stack(
      children: <Widget>[
      Container(
        height: 400,
      decoration: BoxDecoration(

          color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage("images/background.png")
        )
      ),
        width: double.infinity,

        child: Padding(
          padding:  EdgeInsets.only(left: 10, top: 20, right: 20),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                        child: IconButton(icon:      Icon(Icons.clear_all,color: Colors.white, size: 30,), onPressed: ()=>

                        Navigator.push(context, FadeRoute(page: Profile())),
                        )
               ),
                  ),
                  Image.asset("images/notif.png")

                ],
              ),

              SizedBox(height: 20,),

            ],
          ),
        ),
      ),

        Positioned.fill(

          child: Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15), ),
              elevation: 3.0,
              child: Container(
                decoration: BoxDecoration(

                    color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15), )
                ),
                height: 150,

                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
           isSwitched ?     Container(
             margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height:35,
                    width: 100,
                    decoration:BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                      child: Center(child: Text("Personal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:16 ,)))),
                  Text("Overview", style: TextStyle(color: Colors.black.withOpacity(0.2), fontWeight: FontWeight.w500, fontSize:16 ,)),
                  Text("Payment", style: TextStyle(color: Colors.black.withOpacity(0.2), fontWeight: FontWeight.w500, fontSize:16 ,)),
                  Text("Business", style: TextStyle(color: Colors.black.withOpacity(0.2), fontWeight: FontWeight.w500, fontSize:16 ,))
                ],
              ),
           ):



           Container(
                      margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                      height: 35,
                      child:   TabBar(
                        unselectedLabelColor:Colors.black ,
                        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:16 ,),
                        controller: _tabController,
                        isScrollable: true,
                        indicator: RectangularIndicator(
                          color: Colors.orange,
                          bottomLeftRadius: 10,
                          bottomRightRadius: 10,
                          topLeftRadius: 10,
                          topRightRadius: 10,

                        ),
                        tabs: <Widget>[
                          Text('OverView'),
                          Text("Seller's Tools"),
                          Text('Payments'),
                          Text('Business Management'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),
        ),

// CENTER BOX
        Positioned.fill(
          top: 20,
          child: Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 3.0,
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    switches(),

                    Column(
                      children: <Widget>[
                 isClicked  ?   Text("000000000000",  style: TextStyle(
                     fontSize: 34,
                     color: Colors.blueGrey,
                     fontFamily: "SFPro",
                     fontWeight: FontWeight.bold)) :  Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "NGN, ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16, fontFamily: "SFPro", )),
                          TextSpan(
                              text: "0.00",
                              style: TextStyle(
                                  fontSize: 34,
                                  color: Colors.blueGrey,
                                  fontFamily: "SFPro",
                                  fontWeight: FontWeight.bold)),
                        ])),
                        isClicked  ?      Text("Account Number", style: TextStyle(fontSize: 18),) :    Text("Available balance", style: TextStyle(fontSize: 18),),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Account name", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),
                           isSwitched ?  Text("Sum Davon", style: TextStyle(color: greyText),): Text("Sum Glade limited", style: TextStyle(color: greyText),
                           ) ],
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isClicked = !isClicked;
                              });
                            },
                            child: Container(
                              height: 30,
                                child: Image.asset("images/toggler.png",fit: BoxFit.cover,)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
      ),


          SizedBox(
            height: 20,
          ),


//      tabBar view
      Expanded(
        child: AnimatedSwitcher(
          child:
          isSwitched ?  Personal() : Business(tabController: _tabController,),

          duration: Duration(milliseconds: 500),
        ),
      )
    ]
    ),





//bottom nav bar
    bottomNavigationBar: AnimatedSwitcher(
     child:    isSwitched
         ?  PersonalNavBar()  :BusinessNav(),

      duration: Duration(milliseconds: 500),
    ) ,
    );
  }


  Widget switches() {
    return Container(
      decoration: BoxDecoration(
          color: isSwitched ? Colors.orange : kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
      ),

      width: 200,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text( isSwitched ?  "Personal Account" : "Business Account"  , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),),


          Container(
            child:Switch(

              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: kPrimaryColor,
              activeTrackColor: Colors.white,
              activeColor: Colors.orange,
            ),
          )

        ],
      ),
    );
  }



}









