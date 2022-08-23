import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[900],
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.grey[900]),
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey[250]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${data['flag']}',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data['location'],
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: GoogleFonts.poppins(
                  fontSize: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
