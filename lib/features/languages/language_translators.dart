import 'package:translator/translator.dart';

class LanguageTranslators {
  static final translator = GoogleTranslator();

  // transaltes plain object
  static Future<dynamic> translateObject(
      {required Map<String, dynamic> obj,
      required sourceLanguage,
      required targetLanguage}) async {
    try {
      Map<String, dynamic> finalOutput = {};
      for (var key in obj.keys) {
        final newValue = await translator.translate(obj[key],
            from: sourceLanguage, to: targetLanguage);
        print(newValue.text);
        obj[key] = newValue.text;
      }
      return obj;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // translates plain string
  static Future<dynamic> tranlate(
      {required String input,
      required String sourceLanguage,
      required String targetLanguage}) async {
    try {
      final output = await translator.translate(input,
          from: sourceLanguage, to: targetLanguage);
      return output;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // translates any type of object
  static Future<Map<String, dynamic>> translateObjectRecursive({
    required Map<String, dynamic> obj,
    required sourceLanguage,
    required targetLanguage,
  }) async {
    try {
      final translator = GoogleTranslator();

      // Recursively translate strings in the object
      Future<dynamic> translateValue(dynamic value) async {
        if (value is String) {
          // If the value is a string, translate it
          final newValue = await translator.translate(
            value,
            from: sourceLanguage,
            to: targetLanguage,
          );
          return newValue.text;
        } else if (value is Map<String, dynamic>) {
          // If the value is a map, recursively translate its values
          final Map<String, dynamic> translatedMap = {};
          await Future.forEach<String>(value.keys, (key) async {
            translatedMap[key] = await translateValue(value[key]);
          });
          return translatedMap;
        } else if (value is List<dynamic>) {
          // If the value is a list, recursively translate its elements
          final List<dynamic> translatedList = [];
          await Future.forEach<dynamic>(value, (element) async {
            translatedList.add(await translateValue(element));
          });
          return translatedList;
        } else {
          // If the value is not translatable (e.g., int, bool), return as is
          return value;
        }
      }

      // Translate the entire object
      final Map<String, dynamic> translatedObject = {};
      await Future.forEach<String>(obj.keys, (key) async {
        translatedObject[key] = await translateValue(obj[key]);
      });

      return translatedObject;
    } catch (e) {
      print(e);
      return {};
    }
  }
}
