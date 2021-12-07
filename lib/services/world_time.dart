import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;

  bool isDayTime;


  WorldTime({this.location, this.flag, this.url});

 Future<void>  getTime() async{

   //error handling
   try{

     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);

     // get properties from data
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(0,3);

     //create DateTime object
     DateTime now = DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));

     //set the time attribute
     isDayTime = now.hour>6 && now.hour<20 ? true : false ;
     time = DateFormat.jm().format(now);
     //print(time);
   }
   catch(e){
     time = 'Could not retrieve time';
   }

  }

}

