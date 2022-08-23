import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String urlLocation;

  WorldTime({
    required this.urlLocation,
    required this.flag,
    required this.location,
  });

  Future<void> getTime() async {
    try {
      //get data from api and put on a map
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$urlLocation");
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      // get data from map and put it on strings
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //get strings put to date format to correct and transform again to strings
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);

      //
    } catch (e) {
      // print('error found: $e');
      time = 'could not get time data';
    }
  }
}
