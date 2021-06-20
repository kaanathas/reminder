
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:vechile_reminder/Screens/components_list/XDdocuments2.dart';
import 'package:vechile_reminder/services/Manager.dart';
import 'package:adobe_xd/page_link.dart';
import '../forms/XDform.dart';
import '../XDDashboard.dart';

import '../forms/XDform2.dart';

class XDcar extends StatefulWidget {
  const XDcar({Key? key}) : super(key: key);

  @override
  _XDcarState createState() => _XDcarState();
}

class _XDcarState extends State<XDcar> {
  late List<dynamic> listBike=[];
  Manager? manager;
  @override
  void initState() {
    super.initState();
    manager=Manager.getManger();
    Future<Null> data=  manager!.getCar().then((resultat)
    {
      setState(() {

        listBike=resultat;
        // print("helloo");
        print(listBike);

      });

    });
  }

  @override
  Widget build(BuildContext context) {


    // print("build");
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
            color: Colors.white,
            // textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },


            // child: Text('Add' /*style: TextStyle(fontSize: 30),*/)
            child:Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        title: Text(
          'Cars',
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

          // Pinned.fromPins(
          //     Pin(start: 10.0, end: 10.0),
          //     Pin(start: 65.0, end: -61.0),
          //     child: Column(
          //       children: List.generate(listBike.length,(index){
          //         return Card(
          //             elevation: 40,  // Change this
          //             shadowColor: Colors.black38,
          //             child: Padding(
          //               padding:EdgeInsets.all(0.0) ,
          //               child: RaisedButton(
          //                 color: Colors.white,
          //
          //                 padding: EdgeInsets.all(25),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: <Widget>[
          //                     Expanded(
          //                       child: Text(listBike[index].name,
          //                         style: TextStyle(
          //                           fontFamily: 'Segoe UI',
          //                           fontSize: 24,
          //                           color: const Color(0xff0b156e),),
          //                         textAlign: TextAlign.left,),),
          //                     Expanded(
          //                       child: Text(listBike[index].number,
          //                         style: TextStyle(
          //                           fontFamily: 'Segoe UI',
          //                           fontSize: 24,
          //                           color: const Color(0xff0b156e),
          //                         ),
          //                         textAlign: TextAlign.left,),),
          //                   ],
          //                 ),
          //                 onPressed: () async {
          //
          //                   final value = await Navigator.push(context,
          //                     MaterialPageRoute(builder: (context) => XDdocuments1(index: index,list: listBike)),
          //                   );
          //                   // setState(() {
          //                   print("back");
          //                   print(value);
          //                   listBike[index]=value;
          //                   await manager!.writeCars(json.encode(listBike));
          //                   // setState(() {
          //                   //
          //                   // });
          //                   // print(manager!.getBike());
          //
          //                   // });
          //                 },
          //               ),
          //
          //
          //
          //             )
          //         );
          //         // BikeCardView(bike: listBike[index],index: index,list: listBike,);
          //       }),
          //     )
          // ),
          Pinned.fromPins(
              Pin(start: 10.0, end: 10.0),
              Pin(start: 65.0, end: -61.0),
              child: Column(
                children: List.generate(listBike.length,(index){
                  return Container(

                    child: Card(
                        elevation: 40,  // Change this
                        shadowColor: Colors.black38,
                        child: Padding(
                            padding:EdgeInsets.all(0.0) ,
                            child: Row(
                              children: [
                                Container(
                                  width:300,
                                  child: RaisedButton(
                                    color: Colors.white,

                                    padding: EdgeInsets.all(25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(listBike[index].name,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 24,
                                            color: const Color(0xff0b156e),),
                                          textAlign: TextAlign.left,),
                                        Text(listBike[index].number,
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 24,
                                            color: const Color(0xff0b156e),
                                          ),
                                          textAlign: TextAlign.left,),
                                      ],
                                    ),
                                    onPressed: () async {

                                      final value = await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => XDdocuments2(index: index,list: listBike)),
                                      );
                                      // setState(() {
                                      print("back");
                                      print(value);
                                      listBike[index]=value;
                                      await manager!.writeCars(json.encode(listBike));

                                    },
                                  ),
                                ),
                                Container(
                                  color: const Color(0xffffffff),
                                  width: 50,
                                  child: RaisedButton(onPressed: ()async{
                                    await manager!.removeCar(index);
                                    setState(() {

                                    });
                                  },

                                    child: Icon(Icons.remove),),
                                )
                              ],
                            )




                        )
                    ),
                  );
                  // BikeCardView(bike: listBike[index],index: index,list: listBike,);
                }),
              )
          ),

          Pinned.fromPins(
            Pin(size: 58.0, middle: 0.5),
            Pin(size: 78.0, middle: 0.5944),
            child: Container(
              child: RaisedButton(
                color: const Color(0xff5d62e3),
                shape: CircleBorder(
                    side: BorderSide(
                        width: 4.0, color: const Color(0xffffffff)
                    )
                ),
                padding: EdgeInsets.all(14),
                child: Icon(Icons.add,color: Colors.black,size: 30,),
                onPressed: () async {
                  final value = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => XDform2(),
                    ),
                  );
                  setState(() {
                    // print(manager!.getBike());
                    manager!.getCar().then((resultat){
                      setState(() {
                        listBike=resultat;
                      });
                    });
                    // print(listBike);
                  });
                },
              ),

            ),
          ),



          //upgrade
          Pinned.fromPins(
            Pin(start: 29.0, end: 22.0),
            Pin(size: 174.0, end: 46.0),
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Do you want manage more \nvehicle ',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 24,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Upgrade Now',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 33,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.0),
                color: const Color(0x9e2f1edb),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x09060dd9),
                    offset: Offset(0, 17),
                    blurRadius: 18,
                  ),
                ],
              ),
            ),
          ),

          //back

        ],
      ),
    );
  }
}
