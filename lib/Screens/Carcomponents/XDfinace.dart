import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:vechile_reminder/model/Car.dart';
// import '../components_list/XDdocuments1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import '../../model/Bike.dart';

class XDfinace extends StatelessWidget {
  XDfinace({
    Key? key, required this.car,
  }) : super(key: key);
  final Car car;


  @override
  Widget build(BuildContext context) {
    DateTime date=DateTime.parse(car.finacialDue);
    return Scaffold(
      appBar: AppBar(
        leading: PageLink(
            links: [
              PageLinkInfo(
                transition: LinkTransition.Fade,
                ease: Curves.easeOut,
                duration: 0.3,
                // pageBuilder: () => XDdocuments1(),
              ),
            ],
            child:Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        title:  Text(
          'finacialDue',
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
      body:Container(
        height: 150,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 250,left: 10,right: 10),
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
        child: Column(
          children: <Widget>[
            DateTimeFormField(
              firstDate: DateTime.now(),

              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),

              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                date=value;
                print(value);
              },
            ),
            RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  // print(DateFormat.yMMMd().format(DateTime.now()));
                  car.finacialDue=date.toString();

                  Navigator.pop(context,car);

                  // bloc.loginUser(contactNumber, pin);
                },


                child: Text('Add' /*style: TextStyle(fontSize: 30),*/)
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_c1bdak =
    '<svg viewBox="125.7 518.4 24.3 19.6" ><path transform="translate(-484.0, -1769.0)" d="M 609.71484375 2287.4267578125 L 623.5921020507812 2307 L 634 2287.4267578125" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_doy2m0 =
    '<svg viewBox="251.5 328.5 1.0 64.0" ><path transform="translate(251.5, 328.5)" d="M 0 0 L 0 64" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
