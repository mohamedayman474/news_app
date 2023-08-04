import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage='en';

  void setNewLanguage(String newLang)async{
    final prefs = await SharedPreferences.getInstance();
    if(appLanguage==newLang) return;
      appLanguage=newLang;
      prefs.setString('language', newLang);
      notifyListeners();

  }



}