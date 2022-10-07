import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  int main_service_number = 0;
  void setMainServiceNumber(int num) {
    main_service_number = num;
    notifyListeners();
  }
}
