import 'package:flutter/material.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class LangugeBottomSheet extends StatefulWidget {
 

  @override
  State<LangugeBottomSheet> createState() => _LangugeBottomSheetState();
}

class _LangugeBottomSheetState extends State<LangugeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                provider.setNewLanguage('en');
                Navigator.pop(context);
                
              },
              child: getMainView('English',provider.appLanguage=='en')),
          InkWell(
              onTap: (){
                provider.setNewLanguage('ar');
                Navigator.pop(context);
              },
              child: getMainView('العربية',provider.appLanguage=='ar')),




        ],
      ),
    );
  }

  Widget getMainView(String lang, bool selected) {
    if (selected == true) {
      return Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(lang, style: TextStyle(fontSize: 15, color: Theme
                .of(context)
                .primaryColor),),
            Spacer(),
            Icon(Icons.check, color: Theme
                .of(context)
                .primaryColor,)
          ],
        ),
      );
    } else {
      return Container(
          margin: EdgeInsets.all(16),
          child: Text(lang, style: TextStyle(fontSize: 15),));
    }
  }
}
