import 'package:changelanguage/local/share_preference.dart';
import 'package:flutter/material.dart';

enum Themes {light, dark}
class ThemeProvider extends ChangeNotifier {
  Themes useTheme = Themes.light;

  changeTheme(Themes theme) {
    useTheme = theme;
    SharedPref.setData(key: SharedPref.theme, value: theme.name);
    notifyListeners();
  }

  checkTheme() async {
    final changeTheme = await SharedPref.getData(key: SharedPref.theme);
    print('####$changeTheme');

    if(changeTheme == "light"||changeTheme==null){
      useTheme = Themes.light;
    }else{
       useTheme = Themes.dark;
    }
    notifyListeners();
  }
}