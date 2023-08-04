import 'package:flutter/material.dart';
import 'package:news_app/Details/DetailsScreen.dart';
import 'package:news_app/MyThemeData.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:news_app/SplashScreen.dart';
import 'package:news_app/Ui/Settings/SettingsScreen.dart';
import 'package:news_app/Ui/Ui-home/HomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=>AppConfigProvider(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<AppConfigProvider>(context);
    initSharedPreference();
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(provider.appLanguage),
      title: 'Flutter Demo',
      theme:  MyThemeData.lightTheme,
      routes: {
        SplashScreen.ROUTE_NAME:(_)=>SplashScreen(),
        HomeScreen.ROUTE_NAME:(_)=>HomeScreen(),
        SettingsScreen.ROUTE_NAME:(_)=>SettingsScreen(),
        DetailsScreen.ROUTE_NAME:(_)=>DetailsScreen()
      },
      initialRoute: SplashScreen.ROUTE_NAME,

      home: const Scaffold(

      ),
    );
  }
  void initSharedPreference()async{
    final prefs = await SharedPreferences.getInstance();
    provider.setNewLanguage(prefs.getString('language') ?? 'en');
  }
}


