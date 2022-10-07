import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/extras/strings.dart';
import 'package:smart_city/model/weather.dart';
import 'package:smart_city/providers/language_provider.dart';

class WeatherContainer extends StatelessWidget {
  final double heightBlock;
  final double widthBlock;
  final Weather? weatherData;
  const WeatherContainer(
      {Key? key,
      required this.heightBlock,
      required this.widthBlock,
      required this.weatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: heightBlock * 1.25),
      width: widthBlock * 90,
      height: heightBlock * 30,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.yellowAccent, // Change this
        color: Color.fromRGBO(16, 28, 66, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: heightBlock),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widthBlock * 40,
                        child: ListTile(
                          title: Text(
                            weatherData!.getCountry(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            weatherData!.getCity(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Image.asset(
                            "placeholder.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: widthBlock * 7.5),
                        width: widthBlock * 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherData!.getDayName(
                                  context,
                                  Provider.of<LanguageProvider>(context,
                                          listen: true)
                                      .language),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weatherData!.getDate(
                                  context,
                                  Provider.of<LanguageProvider>(context,
                                          listen: true)
                                      .language),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: heightBlock * 12.5,
                    width: widthBlock * 35,
                    margin: EdgeInsets.symmetric(vertical: heightBlock * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightBlock * 8,
                          child: Image.asset(
                            weatherData!.getImage(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          weatherData!.getWeatherStateName(
                              context,
                              Provider.of<LanguageProvider>(context,
                                      listen: true)
                                  .language),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: heightBlock * 2.5,
                        child: Image.asset(
                          "temprature.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: heightBlock),
                        child: Text(
                          weatherData!.getTemprature().toString() +
                              Strings.strings[" C"][
                                  Provider.of<LanguageProvider>(context,
                                          listen: true)
                                      .language],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: heightBlock * 2.5,
                        child: Image.asset(
                          "pressure.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: heightBlock),
                        child: Text(
                          weatherData!.getPressure().toString() +
                              Strings.strings[" mb"][
                                  Provider.of<LanguageProvider>(context,
                                          listen: true)
                                      .language],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: heightBlock * 2.5,
                        child: Image.asset(
                          "wind_speed.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: heightBlock),
                        child: Text(
                          weatherData!.getWindSpeed().toString() +
                              Strings.strings[" Kph"][
                                  Provider.of<LanguageProvider>(context,
                                          listen: true)
                                      .language],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: heightBlock * 2.5,
                        child: Image.asset(
                          "humidity.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: heightBlock),
                        child: Text(
                          weatherData!.getHumidity().toString() + " %",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
