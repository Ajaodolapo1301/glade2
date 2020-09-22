import 'package:flutter/material.dart';
import 'package:glade_app/reusables/pills.dart';






class Personal extends StatelessWidget {
  const Personal({
    Key key,
    @required TabController tabController,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(

      controller: _tabController,
      children: [

        SingleChildScrollView(
          child: Column(
            key: UniqueKey(),
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
    );
  }
}