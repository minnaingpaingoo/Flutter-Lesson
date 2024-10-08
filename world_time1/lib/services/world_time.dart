// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location; //location name for the UI
  String? time; // time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint
  bool? isDaytime; //true or false if daytime or not

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try{
    //make the request
    Response response =
        await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offsetHour = data['utc_offset'].substring(1, 3);
    print(offsetHour);
    String offsetMin = data['utc_offset'].substring(4, 6);
    print(offsetMin);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);

    isDaytime = now.hour < 6 && now.hour > 20 ? true : false;

    now = now.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
    print(now);

    //set the time property
    time = DateFormat.jm().format(now);
    }catch(e){
      print("Error: $e");
      time = "Could not get time data";
    }
  }
}