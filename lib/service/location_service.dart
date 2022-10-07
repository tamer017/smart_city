import 'dart:async';
import 'package:location/location.dart';

class Location_service {
  static fetchLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    String out = "";
    location.onLocationChanged.listen((LocationData currentLocation) {
      out = (currentLocation.latitude.toString() +
          "  " +
          currentLocation.longitude.toString());

      //   setState(() {
      // _currentPosition = currentLocation;
      //     getAddress(_currentPosition.latitude, _currentPosition.longitude)
      //         .then((value) {
      //       setState(() {
      //         _address = "${value.first.addressLine}";
      //       });
      //     });
      //   });
    });
    return out;
  }
}
