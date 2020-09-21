
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
  TextEditingController amount = new TextEditingController();
  TextEditingController narration = new TextEditingController();
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

              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:16 ,),

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
                  Text('Transfer'),
                Text('Bulk Transfer'),
                Text('History'),
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

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text("Transfer Mode", style: TextStyle(fontWeight: FontWeight.bold),),
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
                                            child: Icon(Icons.check, size: 15, color: Colors.white,),
                                            decoration: BoxDecoration(
                                                color: kPrimaryColor,
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
                                                child: Image.asset("images/glademoney.png", fit: BoxFit.cover,)),
                                            SizedBox(height: 15,),
                                            Text("GladPay Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                                            child: Icon(Icons.check, size: 15, color: Colors.white,),
                                            decoration: BoxDecoration(
                                                color: kPrimaryColor,
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
                                            Text("other banks", style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),)
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



           otherBank ?     otherBankWidget()  : gladePayWidget(),
                      ],
                    ),
                  ),
                ),


                Center(child: Text("Bulk Transfer")),
                Center(child: Text("History"))
              ],
            ),
          )
        ],
      ),

      ),
    );


  }



  Widget otherBankWidget(){
    return  SingleChildScrollView(
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
                Text("Select Your Bank ",style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
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

                Text("Account Number", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
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
                Text("Account Name",style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
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


                SizedBox(
                  height: 20,
                ),
                Text("Amount", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(5)
                        ],

                        controller: amount,
                        onTap: () {},
                        autofocus: true,

                        validator: (value) {
                          if (!(value.length > 5 && value.isNotEmpty)) {
                            return "Amount should contain more than 5 characters";
                          }

                          return null;
                        },
                        style: new TextStyle(color: Colors.black, fontSize: 15.0),

                        decoration: InputDecoration(

                            prefixText: 'NGN ',
                            border: InputBorder.none,

                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Text("Narration ", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(

                        controller: narration,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.text,
//                                            validator: (value) {
//                                              if (!(value.length > 5 && value.isNotEmpty)) {
//                                                return "Account should contain more than 5 characters";
//                                              }
//
//                                              return null;
//                                            },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Narration",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Text("Select Beneficiary", style: TextStyle(color: kPrimaryColor),),

          SizedBox(
            height: 20,
          ),
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
                    "Send Money",
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

  Widget gladePayWidget(){
    return  Container(

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

                Text("Account Number" ,style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
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
                Text("Account Name", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
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


                SizedBox(
                  height: 20,
                ),
                Text("Amount", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(5)
                        ],

                        controller: amount,
                        onTap: () {},
                        autofocus: true,

                        validator: (value) {
                          if (!(value.length > 5 && value.isNotEmpty)) {
                            return "Amount should contain more than 5 characters";
                          }

                          return null;
                        },
                        style: new TextStyle(color: Colors.black, fontSize: 15.0),

                        decoration: InputDecoration(

                            prefixText: 'NGN ',
                            border: InputBorder.none,

                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Text("Narration ", style: TextStyle(fontWeight: FontWeight.bold),),
                Center(
                  child: Container(
                    width: 370,
                    margin: EdgeInsets.only(top: 4,  right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7)
//
                    ),
                    child: Container(
                      width: 300,
                      child: TextFormField(

                        controller: narration,
                        onTap: () {},
                        autofocus: true,
                        keyboardType: TextInputType.text,
//                                            validator: (value) {
//                                              if (!(value.length > 5 && value.isNotEmpty)) {
//                                                return "Account should contain more than 5 characters";
//                                              }
//
//                                              return null;
//                                            },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Narration",
                            contentPadding: const EdgeInsets.all(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Text("Select Beneficiary", style: TextStyle(color: kPrimaryColor),),

          SizedBox(
            height: 20,
          ),
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
                    "Send Money",
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


