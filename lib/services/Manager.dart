import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vechile_reminder/model/Bike.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vechile_reminder/model/Car.dart';
import 'dart:async';
import 'dart:io';

import 'package:vechile_reminder/services/AppNotification.dart';
class Manager{
  static Manager? _instance;
  List<dynamic> bikes=[];
  AppNotification? appNotification=AppNotification.getNotificationManager();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/bike.txt');
  }
   // late List<Car> cars;
  Manager._(){

  }
  static Manager? getManger(){
    if(_instance==null){

      _instance=new Manager._();
    }
    return _instance;
  }
  void addBike(Bike bike) async{
    print(DateTime.parse(bike.emissionDue));
    print("emiision");
    if(bikes.length<=4){
      bikes.add(bike);
      await writeBikes(json.encode(bikes));
    }

  }

  Future<void> removeBike(int index){
    int channelId=int.parse(bikes[index].id);
    // appNotification.init();
    bikes.removeAt(index);
    writeBikes(json.encode(bikes));
    // List<PendingNotificationRequest> list=appNotification!.pendingNotificationRequests();
    for(int i=1;i<6;i++){
      print("delete chanal id $channelId $i");
      appNotification!.cancelNoti(channelId+i);
    }
    return writeBikes(json.encode(bikes));

  }
  Future<List> getBike() async{
     List<dynamic> b= await readBike();
     bikes=b;
     return b;
  }
  Future<List<dynamic>> readBike() async {
    try {
      final file = await _localFile;
      // Read the file
      dynamic contents = await file.readAsString();
      List<dynamic> jsonResponse = json.decode(contents);
      List<dynamic> jobList=[];
      jsonResponse.forEach((element) {
        Bike bikeTem=Bike.fromJson(element);
          jobList.add(bikeTem);
      });
      return jobList;
    } catch (e) {
      print("read Bike error");
      print(e);
      return[];

    }
  }
  Future<File> writeBikes(String bikes) async {
    final file = await _localFile;
    print("writing the file");
    print(bikes);
    return await file.writeAsString(bikes);
  }
// Car

  List<dynamic> cars=[];
  Future<File> get _localFile2 async {
    final path = await _localPath;
    return File('$path/cars.txt');
  }
  void addcar(Car car) async{
   if(cars.length<=4){
     cars.add(car);
     await writeCars(json.encode(cars));
   }

  }
  Future<void> removeCar(int index){
    print(cars.length);
    print(index);
    int channelId=int.parse(cars[index].id);
    cars.removeAt(index);
    writeBikes(json.encode(cars));
    for(int i=1;i<6;i++){
      print("delete chanal id $channelId $i");
      appNotification!.cancelNoti(channelId+i);
    }
    return writeCars(json.encode(cars));

  }
  Future<List> getCar() async{
    List<dynamic> b= await readCars();
    cars=b;
    return b;
  }
  Future<List<dynamic>> readCars() async {
    try {
      final file = await _localFile2;
      // Read the file
      dynamic contents = await file.readAsString();
      List<dynamic> jsonResponse = json.decode(contents);
      List<dynamic> jobList=[];
      jsonResponse.forEach((element) {
        Car bikeTem=Car.fromJson(element);
        jobList.add(bikeTem);
      });
      return jobList;
    } catch (e) {
      print("read car error");
      print(e);
      return[];

    }
  }
  Future<File> writeCars(String Cars) async {
    final file = await _localFile2;
    print("writing car file");
    print(file);
    return await file.writeAsString(Cars);
  }





}