import 'package:flutter/material.dart';
import 'package:news_app/Ui/Settings/SettingsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDrawer extends StatelessWidget {

final Function onCategoryRowClicked;
 MyDrawer({required this.onCategoryRowClicked});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(
              child: Text(AppLocalizations.of(context)!.news_app,style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: InkWell(
              onTap: (){
                onCategoryRowClicked();
              },
              child: Row(
                children: [
                  Icon(Icons.list,size: 30,),
                  SizedBox(width: 6,),
                  Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black),)
                ],
              ),
            ),
          ), InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(SettingsScreen.ROUTE_NAME);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 30,),
                  SizedBox(width: 6,),
                  Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black),)
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}



