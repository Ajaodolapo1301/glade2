import 'package:flutter/material.dart';
import 'package:glade_app/constants/colorConstants.dart';

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
                  Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 20),),
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