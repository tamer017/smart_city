import 'package:flutter/cupertino.dart';

class Device {
  String? name;
  bool? on;
  double? timer;
  double? temp;
  String? image;
  Device({required this.on, this.timer, this.temp, required this.name,required this.image});
  
}
