
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



class Fund extends StatefulWidget {
  @override
  _FundState createState() => _FundState();
}




class _FundState extends State<Fund>  with SingleTickerProviderStateMixin {



  final _formkey = GlobalKey<FormState>();

  TabController _tabController;
  int _selectedCard = 0;
  BankState bankState;
  TextEditingController bank = new TextEditingController();
  TextEditingController accountNum = new TextEditingController();
  TextEditingController accountName = new TextEditingController();

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
          backgroundColor: Colors.white,
          title: Text("Fund Transfer", style: TextStyle(color: Colors.black),),
        ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[


          SizedBox(height: 30,),

          Container(
            height: 40,
            child: TabBar(
              unselectedLabelColor:Colors.black ,

              labelStyle: TextStyle(color: Colors.white),

              isScrollable: true,
              controller: _tabController,
//                unselectedLabelColor: Colors.black,
              indicator: RectangularIndicator(
                color: kPrimaryColor,
                bottomLeftRadius: 15,
                bottomRightRadius: 15,
                topLeftRadius: 15,
                topRightRadius: 15,

            ),
              tabs: <Widget>[
                  Text('Transfer', style: TextStyle(fontSize:20 , ),),
                Text('Bulk Transfer',  style: TextStyle(fontSize:20) ,),
                Text('History',  style: TextStyle(fontSize: 20,),),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Transfer Mode"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: InkWell(

                              onTap: (){
                                setState(() {
                                  gladepay = true;
                                  otherBank = false;;
                                });
                                print("1");

                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)
                                ),
                                child: Stack(

                                  children: <Widget>[
                                  gladepay ?   Positioned(
                                      top: 10,
                                      right:10,
                                      child: Material(
                                        elevation: 3,
                                        shape: CircleBorder(),
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          child: Icon(Icons.check, size: 15, color: Colors.green,),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                      ),) : Container(),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height:40,
                                              child: Image.asset("images/bankmoney.png", fit: BoxFit.cover,)),
                                          SizedBox(height: 15,),
                                          Text("GladPay Account", style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  gladepay = false;
                                  otherBank = true;
                                });

                                print("2");

                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Stack(

                                  children: <Widget>[
                            otherBank ?         Positioned(
                                      top: 10,
                                      right:10,
                                      child: Material(
                                        elevation: 3,
                                        shape: CircleBorder(),
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          child: Icon(Icons.check, size: 15, color: Colors.green,),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                      ),) : Container(),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height:40,
                                              child: Image.asset("images/bankmoney.png", fit: BoxFit.cover,)),
                                          SizedBox(height: 15,),
                                          Text("other banks", style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),



           otherBank ?            Container(
                        height: 400,
                        child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 370,
                                      margin: EdgeInsets.only(top: 4, left: 8, right: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(7)
//
                                      ),
                                      child: Container(
                                        width: 300,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: 300,
                                              child: TextFormField(
                                                controller: bank,
                                                onTap: () {
//                                                            showSheet();
                                                },
                                                autofocus: true,
//                          keyboardType: TextInputType.emailAddress,

                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Choose your bank",
                                                    contentPadding: const EdgeInsets.all(20.0)),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.keyboard_arrow_down),
                                              onPressed: () {
//                                                          showSheet();
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 370,
                                      margin: EdgeInsets.only(top: 4, left: 8, right: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(7)

                                      ),
                                      child: Container(
                                        width: 300,
                                        child: TextFormField(
                                          controller: accountNum,
                                          onTap: () {},
                                          onChanged: (v) {
                                            if (v.length < 10) {
                                              accountName.text = "";
                                            } else if (v.length == 10 && bank.text.isNotEmpty) {
//                                                        getName();
                                            }
                                          },
                                          autofocus: true,
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
                                              hintText: "Account num",
                                              contentPadding: const EdgeInsets.all(20.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 370,
                                      margin: EdgeInsets.only(top: 4, left: 8, right: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(7)
//
                                      ),
                                      child: Container(
                                        width: 300,
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: accountName,
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
                                              hintText: "Recipient name",
                                              contentPadding: const EdgeInsets.all(20.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                if (_formkey.currentState.validate()) {
//                                            Navigator.push(context, FadeRoute(page: Last()));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 50, right: 20, left: 20),
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor, borderRadius: BorderRadius.circular(13)),
                                child: Center(
                                    child: Text(
                                      "Next",
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
                      ) : Text("gladepay"),
                    ],
                  ),
                ),


                Text("Second"),
                Text("Thiord")
              ],
            ),
          )
        ],
      ),

      ),
    );
  }
}
