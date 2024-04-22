import 'package:changelanguage/local/share_preference.dart';
import 'package:flutter/material.dart';

enum Language {mm, en}
class LanguageProvider extends ChangeNotifier {
  Language lang = Language.en;

  changeLang(Language lng) {
    lang = lng;
    SharedPref.setData(key: SharedPref.lang, value: lng.name);
    notifyListeners();
  }

  checkLanguage() async {
    final language = await SharedPref.getData(key: SharedPref.lang);
    print('####$language');

    if(language == "en"||language==null){
      lang = Language.en;
    }else{
      lang = Language.mm;
    }
    notifyListeners();
  }
}