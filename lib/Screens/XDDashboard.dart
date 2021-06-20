import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:vechile_reminder/Screens/vechile_list/XDcar.dart';
import 'vechile_list/XDmotorbikes.dart';
import 'package:adobe_xd/page_link.dart';

class XDDashboard extends StatelessWidget {
  XDDashboard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_open,color: Colors.black,),
        title: Text(
          'Vehicle Manage',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 24,
            color: const Color(0xff0b156e),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // main body
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 65.0, end: 1.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white54,
              ),
            ),
          ),
          //side bar

          //title


          Pinned.fromPins(
            Pin(start: 29.0, end: 22.0),
            Pin(size: 174.0, middle: 0.29),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDmotorbikes(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 27),
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          //bike im
          Pinned.fromPins(
            Pin(size: 117.0, middle: 0.5118),
            Pin(size: 32.0, middle: 0.2344),
            child: Text(
              'Bike',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                color: const Color(0xff0b156e),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 165.0, middle: 0.502),
            Pin(size: 165.0, middle: 0.3222),
            child:
            // Adobe XD layer: 'motorbike' (shape)
            PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDmotorbikes(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/bike.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),


          //car container
          Pinned.fromPins(
            Pin(start: 29.0, end: 22.0),
            Pin(size: 174.0, middle: 0.7687),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 27),
                    blurRadius: 18,
                  ),
                ],
              ),
            ),
          ),
          //car text
          Pinned.fromPins(
            Pin(size: 216.0, middle: 0.5201),
            Pin(size: 32.0, middle: 0.6307),
            child: Text(
              'Car/Others',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                color: const Color(0xff0b156e),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 204.0, middle: 0.5524),
            Pin(size: 190.0, end: 121.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDcar(),
                ),
              ],
              child:    Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/car.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Adobe XD layer: 'baby-car' (shape)

          ),






        ],
      ),
    );
  }
}
