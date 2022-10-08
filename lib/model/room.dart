import 'device.dart';

class Room {
  final String name;
  final List<Device> devices;

  Room({required this.name, required this.devices});
  List getDevicesNames() {
    List devices_names = [];
    for (Device device in devices) {
      devices_names.add(device.name);
    }
    return devices_names;
  }
}
