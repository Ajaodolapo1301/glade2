
import 'dart:convert';



import 'package:glade_app/model/user.dart';
import 'package:http/http.dart' as http;
const String Url = "https://demo.api.gladepay.com/resources";




abstract class AbstractApi{
  Future<Map<String,dynamic>> getListOfBanks();
  Future<Map<String,dynamic>> verifyAccount({String accountnum,  String bankCode});
  Future<Map<String,dynamic>> verifyBvn({String bvn});


}


class ListOfBanks with AbstractApi{


  @override
  Future<Map<String,dynamic >> getListOfBanks() async {
    Map<String, dynamic> result = {};

    var headers = {
      "key" : "123456789",
      "mid" : "GP0000001",
      'Content-Type': 'application/json'
    };




    try{
      var response = await http.put(Url, headers: headers, body: jsonEncode({"inquire": "banks"}));
      if(jsonDecode(response.body)["status"] == 101 || jsonDecode(response.body)["status"] == 103  ){
        result['message'] = jsonDecode(response.body)["message"];
        result['error'] = true;
      }else{
        result['error'] = false;
Map ma = jsonDecode(response.body);

        result["banks"] = ma;
      }

    }catch(e){
      print(e.toString());
    }

    return result;
  }

  @override
  Future<Map<String,dynamic >> verifyBvn({String bvn}) async {
    Map<String, dynamic> result = {};
    var headers = {
      "key" : "123456789",
      "mid" : "GP0000001",
      'Content-Type': 'application/json'
    };



    try{
      var response = await http.put(Url, headers: headers, body: jsonEncode({"inquire": "bvn", "bvn": bvn}));

      if(jsonDecode(response.body)["status"] == "error" || jsonDecode(response.body)["resolved"] == false ){
        result['message'] = jsonDecode(response.body)["error"];
        result['error'] = true;
      }else if(jsonDecode(response.body)["status"] == "success"){
        var user = jsonDecode(response.body)["data"];
        print(user);
        var realUser =  User.fromJson(user);
        result["user"] = realUser;
        result['error'] = false;
      }

    }catch(e){
      print(e.toString());
    }

    return result;
  }

  @override
  Future<Map<String, dynamic >> verifyAccount({String accountnum,  String bankCode}) async{
    Map<String, dynamic> result = {};
    var headers = {
      "key" : "123456789",
      "mid" : "GP0000001",
      'Content-Type': 'application/json'
    };


    try{
      var response = await http.put(Url, headers: headers, body: jsonEncode({"inquire": "accountname", "accountnumber": accountnum, "bankcode": bankCode}));

      if(jsonDecode(response.body)["status"] == "error" || jsonDecode(response.body)["resolved"] == false  ){

        result['message'] = jsonDecode(response.body)["error"];
        result['error'] = true;
        print( result['message']);
      }else if(jsonDecode(response.body)["status"] == "success" && jsonDecode(response.body)["resolved"] == true){
        result['error'] = false;
        result["name"] = jsonDecode(response.body)["data"]["account_name"];
      }
    }catch(e){
      print(e.toString());
      result['message'] = e.toString();
    }


    return result;
  }



}

