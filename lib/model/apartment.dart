import 'room.dart';

class Apartment {
  final String id;
  final List<Room> rooms;

  Apartment({required this.id, required this.rooms});
  List getRoomNames() {
    List rooms_names = [];
    for (Room room in rooms) {
      rooms_names.add(room.name);
    }
    return rooms_names;
  }
}
