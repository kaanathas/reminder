

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:vechile_reminder/services/AppNotification.dart';

import 'package:adobe_xd/page_link.dart';
import '../Carcomponents/XDService.dart';
import '../Carcomponents/XDinsurence.dart';
import '../Carcomponents/XDTax.dart';
import '../Carcomponents/XDemisson.dart';
import '../Carcomponents//XDfinace.dart';
import '../vechile_list/XDmotorbikes.dart';
// import '../../XDdocuments2.dart';
import '../../model/Car.dart';
import '../../services/Manager.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class XDdocuments2 extends StatefulWidget {
  const XDdocuments2({Key? key, required this.list, required this.index}) : super(key: key);
  final int index;
  final List<dynamic> list;
  @override
  _XDdocuments2State createState() => _XDdocuments2State();
}

class _XDdocuments2State extends State<XDdocuments2> {
  late AppNotification localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localNotification=AppNotification.getNotificationManager()!;
    // localNotification.init();

  }


  @override
  Widget build(BuildContext context) {
    Car car=widget.list[widget.index];
    DateTime now = DateTime.now();
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          leading: RaisedButton(
              color: Colors.white,
              // textColor: Colors.white,
              onPressed: () {
                // print(DateFormat.yMMMd().format(DateTime.now()));
                // bike.emissionDue=date;

                Navigator.pop(context,car);

                // bloc.loginUser(contactNumber, pin);
              },


              // child: Text('Add' /*style: TextStyle(fontSize: 30),*/)
              child:Icon(Icons.arrow_back_ios,color: Colors.black,)
          ),
          title:  Text(
            car.name,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
              color: const Color(0xff0b156e),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
        ),

        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/emission.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex: 3,),
                              Text(
                                'Emission Test',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1,),
                              RaisedButton(

                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2.0, color: const Color(0xffffffff)
                                    )
                                ),
                                color: Colors.greenAccent,
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.settings,size: 30,),
                                onPressed: () async {
                                  final value = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => XDemisson(car: car,),

                                    ),
                                  );
                                  if(value!=null){
                                    int chanal=(int.parse(value.id))+1;
                                    localNotification.cancelNoti(chanal);
                                    String title=" Emission Test";
                                    String name=value.name;
                                    String data="$name Emission Test Due Today";
                                    // DateTime time=DateTime.parse(value.emissionDue);
                                    print("channal id is $chanal");
                                    DateTime time=DateTime.now().add(const Duration(seconds: 30));
                                    localNotification.showNotification(chanal, title, data, time);
                                  }

                                  setState(() {

                                    // manager.writeBikes(bikes);
                                  });
                                },
                              ),



                            ],
                          ),
                          Spacer(flex: 2,),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(car.emissionDue)),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xffec1717),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/finance.png'),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex: 3,),
                              Text(
                                'Finance Due',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1,),
                              RaisedButton(

                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2.0, color: const Color(0xffffffff)
                                    )
                                ),
                                color: Colors.greenAccent,
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.settings,size: 30,),
                                onPressed: () async {
                                  final value = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => XDfinace(car: car,),

                                    ),
                                  );
                                  if(value!=null){
                                    int chanal=(int.parse(value.id))+2;
                                    localNotification.cancelNoti(chanal);
                                    String name=value.name;
                                    String title=" Finance";
                                    String data="$name Finance Due Today";
                                    DateTime time=DateTime.parse(value.finacialDue);
                                    // DateTime time=DateTime.now().add(const Duration(seconds: 35));
                                    localNotification.showNotification(chanal, title, data, time);
                                  }

                                  setState(() {

                                    // manager.writeBikes(bikes);
                                  });
                                },
                              ),



                            ],
                          ),
                          Spacer(flex: 2,),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(car.finacialDue)),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xffec1717),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/insurence.png'),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex: 3,),
                              Text(
                                'Insurance expire',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1,),
                              RaisedButton(

                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2.0, color: const Color(0xffffffff)
                                    )
                                ),
                                color: Colors.greenAccent,
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.settings,size: 30,),
                                onPressed: () async {
                                  final value = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => XDinsurence(car: car,),

                                    ),
                                  );
                                  if(value!=null){
                                    int chanal=(int.parse(value.id))+3;
                                    localNotification.cancelNoti(chanal);
                                    String name=value.name;
                                    String title=" Insurance Due";
                                    String data="'$name' Insurance expire Today";
                                    DateTime time=DateTime.parse(value.insuranceDue);
                                    // DateTime time=DateTime.now().add(const Duration(seconds: 40));
                                    localNotification.showNotification(chanal, title, data, time);
                                  }

                                  setState(() {

                                    // manager.writeBikes(bikes);
                                  });
                                },
                              ),



                            ],
                          ),
                          Spacer(flex: 2,),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(car.insuranceDue)),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xffec1717),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/service.png'),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex: 3,),
                              Text(
                                'Service On',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1,),
                              RaisedButton(

                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2.0, color: const Color(0xffffffff)
                                    )
                                ),
                                color: Colors.greenAccent,
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.settings,size: 30,),
                                onPressed: () async {
                                  final value = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => XDService(car: car,),

                                    ),
                                  );
                                  if(value!=null){
                                    int chanal=(int.parse(value.id))+4;
                                    localNotification.cancelNoti(chanal);
                                    String name=value.name;
                                    String title=" Service";
                                    String data="$name Service Due Today";
                                    DateTime time=DateTime(value.serviceDue);
                                    // DateTime time=DateTime.now().add(const Duration(seconds: 45));
                                    localNotification.showNotification(chanal, title, data, time);
                                  }

                                  setState(() {

                                    // manager.writeBikes(bikes);
                                  });
                                },
                              ),



                            ],
                          ),
                          Spacer(flex: 2,),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(car.serviceDue)),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xffec1717),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/tax.png'),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex: 3,),
                              Text(
                                'Tax Due',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1,),
                              RaisedButton(

                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2.0, color: const Color(0xffffffff)
                                    )
                                ),
                                color: Colors.greenAccent,
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.settings,size: 30,),
                                onPressed: () async {
                                  final value = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => XDTax(car: car,),

                                    ),
                                  );
                                  if(value!=null){
                                    int chanal=(int.parse(value.id))+5;
                                    localNotification.cancelNoti(chanal);
                                    String title=" Tax";
                                    String name=value.name;
                                    String data="$name Tax Expire Today";
                                    DateTime time=DateTime.parse(value.taxDue);
                                    // DateTime time=DateTime.now().add(const Duration(seconds: 50));
                                    localNotification.showNotification(chanal, title, data, time);
                                  }

                                  setState(() {

                                    // manager.writeBikes(bikes);
                                  });
                                },
                              ),



                            ],
                          ),
                          Spacer(flex: 2,),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(car.taxDue)),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xffec1717),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        )





    );
  }

}



