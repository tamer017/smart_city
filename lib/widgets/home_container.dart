import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/extras/strings.dart';
import 'package:smart_city/extras/data.dart';
import 'package:smart_city/model/device.dart';
import 'package:smart_city/providers/language_provider.dart';
import 'package:smart_city/providers/service_provider.dart';

class HomeContainer extends StatelessWidget {
  final double widthBlock;
  final double heightBlock;

  HomeContainer({Key? key, required this.widthBlock, required this.heightBlock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: buildBackButton(heightBlock, widthBlock, context),
            flex: 1,
          ),
          Expanded(
            child: buildRooms(heightBlock, widthBlock, context),
            flex: 2,
          ),
          Expanded(
            flex: 9,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: widthBlock * 5),
              child: GridView.builder(
                itemCount: Data
                    .apartment
                    .rooms[Provider.of<ServiceProvider>(context, listen: true)
                        .room_number]
                    .devices
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: heightBlock * 22.5),
                itemBuilder: (context, index) => buildContainer(
                  context,
                  heightBlock,
                  widthBlock,
                  index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(context, heightBlock, widthBlock, index) {
    Device device = Data
        .apartment
        .rooms[Provider.of<ServiceProvider>(context, listen: true).room_number]
        .devices[index];
    String? name = device.name;
    String? image = device.image;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: heightBlock * 1, horizontal: widthBlock * 1),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        shadowColor: Colors.yellowAccent, // Change th
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: heightBlock * 1, horizontal: widthBlock * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: widthBlock * 1.25),
                      child: SizedBox(
                        child: Image.asset(image!),
                        height: heightBlock * 6,
                        width: widthBlock * 10,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                flex: 4,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthBlock * 1.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthBlock * 1.25),
                  child: Row(
                    children: [
                      Text(device.on! ? "ON" : "OFF"),
                      Switch(value: device.on!, onChanged: (val) {}),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
        ),
        color: Color.fromRGBO(102, 205, 229, 1),
      ),
    );
  }

  buildRooms(heightBlock, widthBlock, BuildContext context) {
    return SizedBox(
      width: widthBlock * 90,
      child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.yellowAccent, // Change this
          color: Color.fromRGBO(16, 28, 66, 1),
          child: ListView.builder(
            itemCount: Data.apartment.rooms.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Provider.of<ServiceProvider>(context, listen: false)
                  .setRoomNumber(index),
              child: Container(
                alignment: Alignment.center,
                child: Provider.of<ServiceProvider>(context, listen: true)
                            .room_number ==
                        index
                    ? Text(
                        Strings.strings[Data.apartment.getRoomNames()[index]][
                            Provider.of<LanguageProvider>(context, listen: true)
                                .language],
                        style: TextStyle(
                          color: Colors.transparent, // Step 2 SEE HERE
                          shadows: [
                            Shadow(
                              offset: Offset(0, -5),
                              color: Color.fromRGBO(102, 205, 229, 1),
                            ),
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(102, 205, 229, 1),
                          decorationThickness: 4,
                          decorationStyle: TextDecorationStyle.solid,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        Strings.strings[Data.apartment.getRoomNames()[index]][
                            Provider.of<LanguageProvider>(context, listen: true)
                                .language],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                margin: EdgeInsets.symmetric(
                  horizontal: widthBlock * 2.5,
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          )),
    );
  }

  buildBackButton(double heightBlock, double widthBlock, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: heightBlock, left: widthBlock * 3.5),
      alignment: Alignment.topLeft,
      child: TextButton.icon(
        onPressed: () => Provider.of<ServiceProvider>(context, listen: false)
            .setMainServiceNumber(0),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        label: Text(
          Strings.strings["Back to all services"]
              [Provider.of<LanguageProvider>(context, listen: true).language],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
