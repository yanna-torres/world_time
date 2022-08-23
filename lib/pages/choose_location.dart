import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        urlLocation: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(urlLocation: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        urlLocation: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        urlLocation: 'America/Fortaleza',
        location: 'Fortaleza',
        flag: 'brazil.png'),
    WorldTime(
        urlLocation: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        urlLocation: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        urlLocation: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Choose a Location',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateWorldTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}')),
              ),
            ),
          );
        },
      ),
    );
  }

  void updateWorldTime(index) async {
    WorldTime instace = locations[index];
    await instace.getTime();
    Navigator.pop(
      context,
      {
        'location': instace.location,
        'time': instace.time,
        'flag': instace.flag,
      },
    );
  }
}
