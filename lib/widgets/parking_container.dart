import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/extras/strings.dart';
import 'package:smart_city/providers/language_provider.dart';
import 'package:smart_city/providers/service_provider.dart';

class ParkingContainer extends StatelessWidget {
  final double widthBlock;
  final double heightBlock;
  const ParkingContainer(
      {Key? key, required this.widthBlock, required this.heightBlock})
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
          // Expanded(
          //   child: buildRooms(heightBlock, widthBlock, context),
          //   flex: 2,
          // ),
          Expanded(
            flex: 9,
            child: Container(),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: widthBlock * 5),
            //   child: GridView(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2, mainAxisExtent: heightBlock * 22.5),
            //     children: [
            //       buildContainer(
            //           heightBlock,
            //           widthBlock,
            //           "smart-house.png",
            //           Strings.strings["Home"][
            //               Provider.of<LanguageProvider>(context, listen: true)
            //                   .language]),
            //       buildContainer(
            //           heightBlock,
            //           widthBlock,
            //           "garage.png",
            //           Strings.strings["Parking"][
            //               Provider.of<LanguageProvider>(context, listen: true)
            //                   .language]),
            //       buildContainer(
            //           heightBlock,
            //           widthBlock,
            //           "clipboard.png",
            //           Strings.strings["Suggestion"][
            //               Provider.of<LanguageProvider>(context, listen: true)
            //                   .language]),
            //       buildContainer(
            //           heightBlock,
            //           widthBlock,
            //           "electronic-voting.png",
            //           Strings.strings["Voting"][
            //               Provider.of<LanguageProvider>(context, listen: true)
            //                   .language]),
            //     ],
            //   ),
            // ),
          
          ),
        ],
      ),
    );
  }

  Container buildContainer(heightBlock, widthBlock, image, name) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: heightBlock * 1, horizontal: widthBlock * 1),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: heightBlock * 5,
                      child: SizedBox(
                        child: Image.asset(image),
                        height: heightBlock * 6,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                flex: 4,
              ),
              Expanded(
                child: Text("5000"),
                flex: 2,
              ),
              Expanded(
                child: Text("5000"),
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
    List rooms = [
      "Kitchen",
      "Living Room",
      "Bedroom 1",
      "Bedroom 2",
      "Bedroom 3",
      "Bathroom 1",
      "Bathroom 2",
      "Bathroom 3",
      "Dining Room",
    ];
    return SizedBox(
      width: widthBlock * 90,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.yellowAccent, // Change this
        color: Color.fromRGBO(16, 28, 66, 1),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: rooms
              .map(
                (room) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    Strings.strings[room][
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
              )
              .toList(),
        ),
      ),
    );
  }

  buildBackButton(double heightBlock, double widthBlock, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: heightBlock, left: widthBlock * 3.5),
      alignment: Alignment.topLeft,
      child: TextButton.icon(
        onPressed: () =>Provider.of<ServiceProvider>(context, listen: false)
            .setMainServiceNumber(0),        icon: Icon(
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
