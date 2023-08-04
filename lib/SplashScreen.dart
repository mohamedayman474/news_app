import 'package:flutter/material.dart';
import 'package:news_app/Ui/Ui-home/HomeScreen.dart';

class SplashScreen extends StatelessWidget{
 static String ROUTE_NAME='splash screen';
  @override
  Widget build(BuildContext context) {
    navigateToHome(context, HomeScreen.ROUTE_NAME);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/splash.png',fit: BoxFit.fill,),
      ),
    );
  }
  void navigateToHome(BuildContext context, String screenName){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushNamed(context, screenName);
    });
  }
}
