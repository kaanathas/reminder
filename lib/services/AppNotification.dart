import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


// ignore: camel_case_types
class AppNotification{
 static AppNotification? _intance;
   static late FlutterLocalNotificationsPlugin localNotification;

  AppNotification._();





  static AppNotification? getNotificationManager(){
   if(_intance==null){
     _intance=new AppNotification._();
     var androidInitial=new AndroidInitializationSettings('ic_launcher');
     late var iosInitialize=new IOSInitializationSettings();
     var initializationSettings =new InitializationSettings(android: androidInitial,iOS: iosInitialize);
     localNotification=new FlutterLocalNotificationsPlugin();
     localNotification.initialize(initializationSettings);
   }
   return _intance;
  }
  Future cancelNoti(int channel) async{
    // final List<PendingNotificationRequest> pendingNotificationRequests = await localNotification.pendingNotificationRequests();
    // print(pendingNotificationRequests);
    await localNotification.cancel(channel);
  }

  Future showNotification(int chanal,String title,String data,DateTime time) async{
    var androidDetails= new AndroidNotificationDetails(
        "channelId",
        "Local Notifications",
        "This is the description of the no",importance: Importance.high);
    var iosDetails=new IOSNotificationDetails();
    var generalNotificationDetails=new NotificationDetails(android: androidDetails,iOS:iosDetails);

    // await localNotification.show(0, "notif  Title", "the body of the Notificatio",generalNotificationDetails);
    //DateTime.now().add(const Duration(seconds: 30))
    tz.initializeTimeZones();
    await localNotification.zonedSchedule(
        chanal,
        title,
        data,
        tz.TZDateTime.from(time, tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name', 'your channel description',
                importance: Importance.high),
            iOS: IOSNotificationDetails()
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
    print("alert set $title");
  }




}