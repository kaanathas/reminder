import 'dart:math';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:vechile_reminder/model/Bike.dart';
import 'package:vechile_reminder/services/Manager.dart';
import '../vechile_list/XDmotorbikes.dart';
import 'package:adobe_xd/page_link.dart';

class XDform extends StatelessWidget {
  XDform({
    Key? key,
  }) : super(key: key);
  Manager? manager=Manager.getManger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          color: Colors.white,
        ),
        title: Text(
          'Add Bike',
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
      body: Container(
        child: Vform(),
      ),
      );

  }
}

class Vform extends StatefulWidget {
  const Vform({Key? key}) : super(key: key);

  @override
  _VformState createState() => _VformState();
}

class _VformState extends State<Vform> {
  final _formKey = GlobalKey<FormState>();


  // print(li.length);
  @override
  Widget build(BuildContext context) {
     String bikeName='';
     String number='';
     Manager? manager=Manager.getManger();
    List<dynamic> li=manager!.bikes;
    return Container(
      height: 250,
       padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 150,left: 10,right: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(

              onChanged: (String value){bikeName=value;},
              keyboardType: TextInputType.text,
              // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              // maxLength: 10,
              decoration: InputDecoration(
                  labelText: "Enter Your bike name",
                  hintText: "Number",
                  // icon: Icon(Icons.phone_iphone)
              ),
              validator: (value) {
                if (value!.isEmpty ) {
                  return 'Please Your bike name';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (String value){number=value;},
              keyboardType: TextInputType.text,
              // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              // maxLength: 10,
              decoration: InputDecoration(
                  labelText: "Enter Your No",
                  hintText: "Number",
                  // icon: Icon(Icons.bike)
      ),
              validator: (value) {
                if (value!.isEmpty ) {
                  return 'Please Enter no ';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    // ***_formKey.currentState.save();***
                      DateTime date=DateTime.now();
                      var rn = new Random();
                      String id=rn.nextInt(1000).toString();
                      // Bike bike=new Bike(bikeName,number,date,date,date,date,date);
                      Bike bike=new Bike(bikeName, number,date.toString(),
                          date.toString(),
                          date.toString(),
                          date.toString(),
                          date.toString(),
                          id);
                      // print(bike.da);
                      manager.addBike(bike);

                      setState(() {
                        li=manager.bikes;
                        print(li.length);
                      });
                      Navigator.pop(context);

                      // bloc.loginUser(contactNumber, pin);
                  }
                  },
                  child: Text('Add' /*style: TextStyle(fontSize: 30),*/)),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34.0),
        color: const Color(0xFFF4F9F9),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFAAAAAA),
            offset: Offset(0, 17),
            blurRadius: 18,
          ),
        ],
      ),
    );
  }
}

