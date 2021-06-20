import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'XDDashboard.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:your_splash/your_splash.dart';

import 'package:google_fonts/google_fonts.dart';
class XDflashscreen extends StatelessWidget {
  XDflashscreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.timed(
        seconds: 4,
        route: MaterialPageRoute(builder: (_) => XDDashboard()),
        body: Scaffold(
           body: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(start: -1.0, end: -83.0),
                Pin(start: -7.0, end: -3.0),
                child: Container(
              decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage('assets/images/flash.jpg'),
            fit: BoxFit.fill,
            ),
    ),
                ),
          ),
          Pinned.fromPins(
            Pin(size: 374.0, middle: 0.5),
            Pin(size: 178.0, middle: 0.4404),
            child: Text(
              'Vehicle Reminder',
              style: GoogleFonts.anticSlab(
                fontSize: 40,
                textStyle: TextStyle(color: Colors.white, letterSpacing: 0.5,),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 262.0, middle: 0.5),
            Pin(size: 162.0, middle: 0.5816),
            child: Text(
              'Mange your all vehicles in\none app',
               style: GoogleFonts.anticSlab(
    fontSize: 20,
    textStyle: TextStyle(color: Colors.white, letterSpacing: 0.5,),
    ),
    textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    )));

  }
}
