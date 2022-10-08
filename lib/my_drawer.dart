import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_city/providers/language_provider.dart';

import 'extras/strings.dart';

class MyDrawer extends StatelessWidget {
  final String name;
  final String apartment_id;

  const MyDrawer({Key? key, required this.name, required this.apartment_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightBlock = MediaQuery.of(context).size.height / 100;
    double widthBlock = MediaQuery.of(context).size.width / 100;
    return ChangeNotifierProvider<LanguageProvider>(
      create: (_) => LanguageProvider(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 28, 66, 1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(widthBlock * 10),
                ),
              ),
              accountName: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                apartment_id,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 28, 66, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(widthBlock * 2.5),
                ),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: widthBlock * 1.25, vertical: heightBlock),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthBlock * 2.5),
                  ),
                ),
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: Text(
                  Strings.strings['Profile'][
                      Provider.of<LanguageProvider>(context, listen: true)
                          .language],
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 28, 66, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(widthBlock * 2.5),
                ),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: widthBlock * 1.25, vertical: heightBlock),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthBlock * 2.5),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Provider.of<LanguageProvider>(context, listen: true)
                                        .language ==
                                    "ENG"
                                ? Color.fromRGBO(102, 205, 229, 1)
                                : const Color.fromRGBO(16, 28, 66, 1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLanguage();
                      },
                      child: Image.asset("united-kingdom.png"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Provider.of<LanguageProvider>(context, listen: true)
                                        .language !=
                                    "ENG"
                                ? Color.fromRGBO(102, 205, 229, 1)
                                : const Color.fromRGBO(16, 28, 66, 1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLanguage();
                      },
                      child: Image.asset("saudi-arabia.png"),
                    )
                  ],
                ),
                leading: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                title: Text(
                  Strings.strings['Language'][
                      Provider.of<LanguageProvider>(context, listen: true)
                          .language],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 28, 66, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(widthBlock * 2.5),
                ),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: widthBlock * 1.25, vertical: heightBlock),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthBlock * 2.5),
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  Strings.strings['Log out'][
                      Provider.of<LanguageProvider>(context, listen: true)
                          .language],
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(heightBlock * 2.5),
              child: Text(
                "V.0.1",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
