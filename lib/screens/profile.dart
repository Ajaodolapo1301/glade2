

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glade_app/animation/fadeRoute.dart';
import 'package:glade_app/constants/colorConstants.dart';
import 'package:glade_app/reusables/customIndicator.dart';
import 'package:glade_app/utils/CustomUtils.dart';
import 'package:glade_app/view_model/bank.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}




class _ProfileState extends State<Profile>  with SingleTickerProviderStateMixin {



  final _formkey = GlobalKey<FormState>();

  TabController _tabController;
  int _selectedCard = 0;
  BankState bankState;
  TextEditingController refCode = new TextEditingController();
  TextEditingController fullName = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController bvn = new TextEditingController();
  TextEditingController email = new TextEditingController();
  var result;

  bool gladepay = true;
  bool otherBank = false;

  ProgressDialog pd;
  void showPdDialog() async {
    pd = await CustomUtils.showProgressDialog(
        context, "Processing...Please wait!");
  }


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back, color: kPrimaryColor,),),
          backgroundColor: Colors.white,
          title: Text("Profile", style: TextStyle(color: Colors.black),),
        ),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


            SizedBox(height: 30,),

            Container(
              height: 35,
              child: TabBar(
                unselectedLabelColor:Colors.black ,

                labelStyle: TextStyle(color: Colors.white),

                isScrollable: true,
                controller: _tabController,
//                unselectedLabelColor: Colors.black,
                indicator: RectangularIndicator(
                  color: kPrimaryColor,
                  bottomLeftRadius: 10,
                  bottomRightRadius: 10,
                  topLeftRadius: 10,
                  topRightRadius: 10,

                ),
                tabs: <Widget>[
                  Text('Personal info', style: TextStyle(fontSize:16 , ),),
                  Text('Business info',  style: TextStyle(fontSize:16) ,),
                  Text('Security',  style: TextStyle(fontSize: 16,),),
                ],
              ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                            backgroundImage: AssetImage("images/avatar.png"),
                              radius: 40,
                            ),
                            SizedBox(height: 5,),
                            Text("sum davon"),
                            Text("Square Motion", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(thickness: 1.0, endIndent: 0.2, indent: 0.2,),

                   personalInfo(),
                      ],
                    ),
                  ),


                  Center(child: Text("Business Info")),
                  Center(child: Text("Security"))
                ],
              ),
            )
          ],
        ),

      ),
    );


  }





  Widget personalInfo(){
    return  Container(
margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),

                Text("Full name" ,style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(

                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)

                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        readOnly: true,
                        controller: fullName,
                        onTap: () {},
//                        onChanged: (v) {
//                          if (v.length < 10) {
//                            accountName.text = "";
//                          } else if (v.length == 10 && bank.text.isNotEmpty) {
////                                                        getName();
//                          }
//                        },
//                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (e) {
                          if (e.length < 1) {
                            return "enter a valid Account number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "sum davon",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        readOnly: true,
                        controller: phone,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (!(value.length > 5 && value.isNotEmpty)) {
                            return "Account should contain more than 5 characters";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "+234567890876",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Text("BVN ID", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(

                        controller: email,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
//                                            validator: (value) {
//                                              if (!(value.length > 5 && value.isNotEmpty)) {
//                                                return "Account should contain more than 5 characters";
//                                              }
//
//                                              return null;
//                                            },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "123456789098",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Text("Email ", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(

                        controller: email,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
//                                            validator: (value) {
//                                              if (!(value.length > 5 && value.isNotEmpty)) {
//                                                return "Account should contain more than 5 characters";
//                                              }
//
//                                              return null;
//                                            },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Davon@glade.ng",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Text("Referral Code ", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(

                        controller: email,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
//                                            validator: (value) {
//                                              if (!(value.length > 5 && value.isNotEmpty)) {
//                                                return "Account should contain more than 5 characters";
//                                              }
//
//                                              return null;
//                                            },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "GD02121233444444",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          InkWell(
            onTap: () {
              if (_formkey.currentState.validate()) {
//                                            Navigator.push(context, FadeRoute(page: Last()));
              }
            },
            child: Container(
//              margin: EdgeInsets.only( ),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                    "Save changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 20,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );

  }

}


