

import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/constants/colorConstants.dart';
import 'package:glade_app/screens/fundTransfer.dart';
import 'package:glade_app/screens/profile.dart';
import 'package:hive/hive.dart';
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
          padding:  EdgeInsets.only(left: 10, top: 20, right: 10),
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
                  InkWell(
                    onTap: (){
                          Navigator.push(context, FadeRoute(page: Fund()));
                    },
                    child: Image.asset("images/notif.png"),
                  )

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
             height: 35,
             child:   TabBar(
               onTap: null,

               unselectedLabelColor:Colors.black.withOpacity(0.2) ,

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
                 Text('Personal'),
                 Text("Seller's Tools"),
                 Text('Payments'),
                 Text('Business Management'),
               ],
             ),
           ):      Container(
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
                     fontFamily: "SFPro",
                     fontWeight: FontWeight.bold)) :  Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "NGN, ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, fontFamily: "SFPro", )),
                          TextSpan(
                              text: "0.00",
                              style: TextStyle(
                                  fontSize: 34,
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
      isSwitched ?         Expanded(
        child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Pills(
                    image: "images/budget.png",
                    text: "Budget",
                    subText: "Set a limit to your spending",
                  ),
                  SizedBox(height: 20,),
                  Pills(
                    image: "images/savings.png",
                    text: "Savings",
                    subText:"Put away money for small and large project or goals",
                  ),
                  SizedBox(height: 20,),
                  Pills(
                    image: "images/personal.png",
                    text: "Fund Personal Account",
                    subText: "Fund your Account with just a click",
                  ),
                  SizedBox(height: 20,),


                ],
              ),
            ),

            Center(child: Text("Business Info", style: TextStyle(color: Colors.white.withOpacity(0.1)),)),
            Center(child: Text("Business Info")),
            Center(child: Text("Security"))
          ],
        ),
      ):




      Expanded(
            child: TabBarView(
//              physics: AlwaysScrollableScrollPhysics(),
              controller: _tabController,
              children: [

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Pills(
                        image: "images/fundtrans.png",
                        text: "Fund Transfer",
                        subText: "Set a limit to your spending",
                      ),
                      SizedBox(height: 20,),
                      Pills(
                        image: "images/pos.png",
                        text: "Customers",
                        subText: "Set a limit to your spending",
                      ),
                      SizedBox(height: 20,),
                      Pills(
                        image: "images/budget.png",
                        text: "Budget",
                        subText: "Set a limit to your spending",
                      ),
                      SizedBox(height: 20,),
                      Pills(
                        image: "images/budget.png",
                        text: "Invoice",
                        subText: "Set a limit to your spending",
                      ),

                      SizedBox(height: 20,),
                      Pills(
                        image: "images/pos.png",
                        text: "Pos",
                        subText: "Set a limit to your spending",
                      ),

                    ],
                  ),
                ),

                Center(child: Text("Business Info")),
                Center(child: Text("Business Info")),
                Center(child: Text("Security"))
              ],
            ),
          )


    ]
    ),






    bottomNavigationBar: isSwitched
        ?  BottomNavigationBar(

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

    )  :BottomNavigationBar(

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

    ) ,
    );
  }


  Widget switches({bool toggler, String text}) {
    return Container(
      decoration: BoxDecoration(
          color: isSwitched ? Colors.orange : kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
      ),

      width: 240,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text( isSwitched ?  "Personal Account" : "Business Account"  , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),),


          Container(

//              height: 25,
//              width: 40,
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

class Pills extends StatelessWidget {
  final image;
  final text;
  final subText;
  Pills({this.text, this.image, this.subText});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        margin: EdgeInsets.only(left: 15, right: 15),

        height: 90,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
        ),



        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(

            children: <Widget>[
              Image.asset(image),
              SizedBox(width: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Container(child: Text(subText , style: TextStyle(color: greyText, ),overflow: TextOverflow.ellipsis,))
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color:greyText ,)
            ],
          ),
        ),
      ),
    );
  }
}