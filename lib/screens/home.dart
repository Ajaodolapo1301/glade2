

import 'package:flutter/material.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/constants/colorConstants.dart';
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
          padding:  EdgeInsets.only(left: 10, top: 20, right: 0),
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
                        child: IconButton(icon:      Icon(Icons.clear_all, size: 30,), onPressed: ()=>

                        Navigator.push(context, FadeRoute(page: Profile())),
                        )
               ),
                  ),
                  IconButton(icon:      Icon(Icons.notifications, size: 30,), onPressed: ()=>

                      Navigator.push(context, FadeRoute(page: Fund())),
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
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                      height: 35,
                      child: TabBar(
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
            child: Card(
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
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
                Pills(),
                      SizedBox(height: 20,),
                      Pills(),
                      SizedBox(height: 20,),
                      Pills(),
                      SizedBox(height: 20,),
                      Pills(),

                      SizedBox(height: 20,),
                      Pills(),

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






    bottomNavigationBar:BottomNavigationBar(

//      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xffDEC489),
      selectedIconTheme: IconThemeData(color:Color(0xffDEC489) ),


      iconSize: 30.0,
//      onTap: (int index){
//        setState(() {
//          _selectedIndex = index;
//        });
//      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home),),
          activeIcon:IconButton(icon: Icon(Icons.home),),

          title: Text('Home',),
        ),

        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home),),
          activeIcon:IconButton(icon: Icon(Icons.home),),

          title: Text('Home',),
        ),

        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home),),
          activeIcon:IconButton(icon: Icon(Icons.home),),

          title: Text('Home',),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home),),
          activeIcon:IconButton(icon: Icon(Icons.home),),

          title: Text('Home',),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home),),
          activeIcon:IconButton(icon: Icon(Icons.home),),

          title: Text('Home',),
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
}

class Pills extends StatelessWidget {
  const Pills({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        margin: EdgeInsets.only(left: 10, right: 10),

        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
        ),



        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(

            children: <Widget>[
              Image.asset("images/bankmoney.png"),
              SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Account Insight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text("Get detailed insight into your activity" , style: TextStyle(color: greyText, ),)
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