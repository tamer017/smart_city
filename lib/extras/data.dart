import 'package:smart_city/model/apartment.dart';
import 'package:smart_city/model/device.dart';
import 'package:smart_city/model/room.dart';

class Data {
  static Apartment apartment = new Apartment(id: "Kl234", rooms: [
    new Room(name: "Kitchen", devices: [
      new Device(on: false, name: "window", image: "window.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Microwave",
          timer: 10,
          image: "microwave.png")
    ]),
    new Room(name: "Living Room", devices: [
      new Device(
          on: false, name: "Home Assistant", image: "voice-assistant.png"),
      new Device(
          on: false, name: "Television", timer: 10, image: "watch-tv.png"),
      new Device(
          on: false,
          name: "Vacuum robot",
          timer: 10,
          image: "vacuum-cleaner.png"),
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(on: false, name: "window", image: "window.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Heater",
          timer: 10,
          image: "plate-heat-exchangers.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Air conditioning",
          timer: 10,
          image: "air-conditioner.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "Fan", timer: 10, image: "fan.png")
    ]),
    new Room(name: "Bedroom 1", devices: [
      new Device(
          on: false,
          temp: 25,
          name: "Air conditioning",
          timer: 10,
          image: "air-conditioner.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "window", image: "window.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Heater",
          timer: 10,
          image: "plate-heat-exchangers.png"),
      new Device(on: false, name: "Fan", timer: 10, image: "fan.png"),
      new Device(
          on: false, name: "Television", timer: 10, image: "watch-tv.png"),
      new Device(on: false, name: "Door", image: "door-lock.png")
    ]),
    new Room(name: "Bedroom 2", devices: [
      new Device(on: false, name: "Fan", timer: 10, image: "fan.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Heater",
          timer: 10,
          image: "plate-heat-exchangers.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Air conditioning",
          timer: 10,
          image: "air-conditioner.png"),
      new Device(on: false, name: "window", image: "window.png")
    ]),
    new Room(name: "Bedroom 3", devices: [
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(on: false, name: "Fan", timer: 10, image: "fan.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Heater",
          timer: 10,
          image: "plate-heat-exchangers.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Air conditioning",
          timer: 10,
          image: "air-conditioner.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "window", image: "window.png")
    ]),
    new Room(name: "Bathroom 1", devices: [
      new Device(
          on: false,
          temp: 25,
          name: "Washing machine",
          timer: 10,
          image: "washing-machine.png"),
      new Device(on: false, name: "window", image: "window.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "Door", image: "door-lock.png"),
    ]),
    new Room(name: "Bathroom 2", devices: [
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(on: false, name: "window", image: "window.png")
    ]),
    new Room(name: "Bathroom 3", devices: [
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(on: false, name: "window", image: "window.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png")
    ]),
    new Room(name: "Dining Room", devices: [
      new Device(on: false, name: "Door", image: "door-lock.png"),
      new Device(on: false, name: "Fan", timer: 10, image: "fan.png"),
      new Device(on: false, name: "window", image: "window.png"),
      new Device(on: false, name: "Lamp", timer: 10, image: "ceiling-lamp.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Heater",
          timer: 10,
          image: "plate-heat-exchangers.png"),
      new Device(
          on: false,
          temp: 25,
          name: "Air conditioning",
          timer: 10,
          image: "air-conditioner.png")
    ]),
  ]);
}
