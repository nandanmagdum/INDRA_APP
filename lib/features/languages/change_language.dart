import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  final List locale = [
    {
      'name': "English",
      'locale': Locale('en', 'US'),
    },
    {
      'name': "हिंदी",
      'locale': Locale('hi', 'IN'),
    },
    {
      'name': "मराठी",
      'locale': Locale('mar', 'IN'),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            print(prefs.getString("lang"));
            print(prefs.getString("country"));
            print(locale);
          },
        ),
        appBar: AppBar(
          title: Text("Choose Language"),
        ),
        body: ListView.builder(
            itemCount: locale.length,
            itemBuilder: (context, index) => buildContainer(
                lang: locale[index]['name'], locale: locale[index]['locale'])));
  }

  GestureDetector buildContainer(
      {required String lang, required Locale locale}) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (lang == "हिंदी") {
          prefs.setString("lang", "hi");
        } else if (lang == "मराठी") {
          prefs.setString("lang", "mar");
        } else {
          prefs.setString("lang", "en");
        }
        var updatedLang = locale;
        Get.updateLocale(updatedLang);
        Navigator.pop(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.green[100],
        margin: EdgeInsets.all(10),
        child: Center(
            child: Text(
          lang,
          style: TextStyle(fontSize: 32),
        )),
      ),
    );
  }
}
