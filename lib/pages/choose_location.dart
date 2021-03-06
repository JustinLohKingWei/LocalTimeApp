import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Choose_location extends StatefulWidget {
  @override
  _Choose_locationState createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url:'Asia/Kuala_Lumpur',location: 'Malaysia',flag: 'malaysia.jpg',),
  ];

  void updateTime (index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title:  Text(locations[index].location) ,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
          }),
    );
  }
}
