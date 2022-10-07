import 'package:flutter/material.dart';
import 'package:smart_city/home.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/providers/language_provider.dart';
import 'package:smart_city/providers/service_provider.dart';
import 'package:smart_city/providers/weathe_provider.dart';

main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider<ServiceProvider>(
            create: (context) => ServiceProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          canvasColor: Color.fromRGBO(4, 16, 58, 1),
          primaryColor: Color.fromRGBO(4, 16, 58, 1),
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
