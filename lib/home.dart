import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/extras/strings.dart';
import 'package:smart_city/providers/language_provider.dart';
import 'package:smart_city/providers/service_provider.dart';
import 'package:smart_city/providers/weathe_provider.dart';
import 'package:smart_city/widgets/Weather_Container.dart';
import 'package:smart_city/widgets/home_container.dart';
import 'package:smart_city/widgets/parking_container.dart';
import 'package:smart_city/widgets/sevices_container.dart';
import 'package:smart_city/widgets/suggestion_container.dart';
import 'package:smart_city/widgets/voting_container.dart';

import 'my_drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String name = "Yousef";
  @override
  void initState() {
    Provider.of<WeatherProvider>(context, listen: false)
        .getWeather(cityName: "cairo");
    Provider.of<LanguageProvider>(context, listen: false).getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightBlock = MediaQuery.of(context).size.height / 100;
    double widthBlock = MediaQuery.of(context).size.width / 100;

    return Provider.of<WeatherProvider>(context, listen: true).weatherData ==
            null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: MyDrawer(
              name: name,
              apartment_id: "KW2345",
            ),
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(heightBlock * 8.5), // here the desired height
              child: AppBar(
                elevation: 0.5,
                shadowColor: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(widthBlock * 10, 10.0),
                  ),
                ),
                title: ListTile(
                  contentPadding: EdgeInsets.only(top: heightBlock),
                  title: Text(
                    Strings.strings["Hello"][
                            Provider.of<LanguageProvider>(context, listen: true)
                                .language] +
                        " ${name} !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    Strings.strings[
                            "Always save energy and turn off your equipment."][
                        Provider.of<LanguageProvider>(context, listen: true)
                            .language],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: FlutterLogo(),
                  // leading: Icon(Icons.menu),
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(
                  top: heightBlock * 1.25,
                  bottom: heightBlock * 1.25,
                  left: widthBlock * 2.5,
                  right: widthBlock * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeatherContainer(
                      weatherData:
                          Provider.of<WeatherProvider>(context, listen: true)
                              .weatherData,
                      widthBlock: widthBlock,
                      heightBlock: heightBlock),
                  getService(
                      Provider.of<ServiceProvider>(context, listen: true)
                          .main_service_number,
                      widthBlock,
                      heightBlock),
                ],
              ),
            ),
          );
  }
}

getService(serviceNumber, widthBlock, heightBlock) {
  switch (serviceNumber) {
    case 0:
      return ServicesContainer(
          widthBlock: widthBlock, heightBlock: heightBlock);
    case 1:
      return HomeContainer(widthBlock: widthBlock, heightBlock: heightBlock);
    case 2:
      return ParkingContainer(widthBlock: widthBlock, heightBlock: heightBlock);
    case 3:
      return SuggestionContainer(
          widthBlock: widthBlock, heightBlock: heightBlock);
    case 4:
      return VotingContainer(widthBlock: widthBlock, heightBlock: heightBlock);
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Position? _currentPosition;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_currentPosition != null)
//               Text(
//                   "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"),
//             FlatButton(
//               child: Text("Get location"),
//               onPressed: () {
//                 _getCurrentLocation();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _getCurrentLocation() {
//     Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.best,
//             forceAndroidLocationManager: true)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
// }
// Container(
//               height: heightBlock * 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: widthBlock * 42.5,
//                     margin: EdgeInsets.symmetric(
//                         vertical: heightBlock * 2.5,
//                         horizontal: widthBlock * 0.5),
//                     child: Card(
//                       color: Colors.red,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Image.asset(
//                           //   "home.png",
//                           //   fit: BoxFit.fill,
//                           // ),
//                           Text("36c"),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: widthBlock * 42.5,
//                     margin: EdgeInsets.symmetric(
//                         vertical: heightBlock * 2.5,
//                         horizontal: widthBlock * 1.25),
//                     child: Card(
//                       color: Colors.red,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("${date.hour} : ${date.minute}"),
//                           Text("${weakdays[date.weekday - 1]}"),
//                           Text(
//                               "${date.day} ${yearmonths[date.month - 1]} ${date.year}"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
