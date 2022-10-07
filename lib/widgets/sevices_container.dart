import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/extras/strings.dart';
import 'package:smart_city/providers/language_provider.dart';
import 'package:smart_city/providers/service_provider.dart';

class ServicesContainer extends StatelessWidget {
  final double widthBlock;
  final double heightBlock;
  List<String> images = [
    "smart-house.png",
    "garage.png",
    "clipboard.png",
    "electronic-voting.png"
  ];
  List<String> services_names = ["Home", "Parking", "Suggestion", "Voting"];
  ServicesContainer(
      {Key? key, required this.widthBlock, required this.heightBlock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widthBlock * 5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: heightBlock * 22.5),
          itemCount: 4,
          itemBuilder: (context, index) => buildContainer(
              context,
              heightBlock,
              widthBlock,
              images[index],
              Strings.strings[services_names[index]][
                  Provider.of<LanguageProvider>(context, listen: true)
                      .language],
              index),
        ),
      ),
    );
  }

  Widget buildContainer(context, heightBlock, widthBlock, image, name, index) {
    return GestureDetector(
      onTap: () => Provider.of<ServiceProvider>(context, listen: false)
          .setMainServiceNumber(index + 1),
      child: Container(
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
                vertical: heightBlock * 1.5, horizontal: widthBlock * 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: heightBlock * 10,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          color: Color.fromRGBO(102, 205, 229, 1),
        ),
      ),
    );
  }
}
