import 'package:flutter/material.dart';
import 'package:news_app/MyThemeData.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:news_app/Ui/Settings/LangueBottomSheet.dart';
import 'package:news_app/Ui/Ui-home/HomeScreen.dart';
import 'package:news_app/Ui/widgets/MyDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class SettingsScreen extends StatefulWidget {
  static var ROUTE_NAME='settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Scaffold(
      drawer: MyDrawer(onCategoryRowClicked: onCategoryDrawerClicked,),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight:  Radius.circular(24),bottomLeft:  Radius.circular(24))
        ),
        backgroundColor: MyThemeData.colorPrimary,
        title: Text(AppLocalizations.of(context)!.settings,),
        centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
              child: Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black,))),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green)
              ),
              child: Row(
              children: [
                Text(provider.appLanguage=='en'?'English':'العربية'),
                const Spacer(),
                Icon(Icons.arrow_drop_down,color: Theme.of(context).primaryColor,)
              ],
            )
            ),
          )
        ],
      ),
    );
  }

  onCategoryDrawerClicked() {
    Navigator.pushReplacementNamed(context, HomeScreen.ROUTE_NAME);
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context){
      return LangugeBottomSheet();

    });
  }
}
