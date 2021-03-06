import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading' ;

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Malaysia',flag: 'malaysia.png',url:'Asia/Kuala_Lumpur');
  await instance.getTime();
 Navigator.pushReplacementNamed(context,'/home',arguments: {
   'location':instance.location,
   'flag': instance.flag,
   'time': instance.time,
   'isDayTime': instance.isDayTime,

 });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
