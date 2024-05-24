import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      onTap: () {
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
