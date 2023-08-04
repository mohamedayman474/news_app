import 'package:flutter/material.dart';
import 'package:news_app/ApiManager/ApiManager.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import 'NewsDetails.dart';
import 'tabItem.dart';

class HomeTabsFragment extends StatefulWidget {
  String categoryId;
  HomeTabsFragment(this.categoryId);
  @override
  State<HomeTabsFragment> createState() => _HomeTabsFragmentState();
}

class _HomeTabsFragmentState extends State<HomeTabsFragment> {
  List<Source> sources = [];

  int selectedIndex=0;

  @override
  void initState() {
    super.initState();
    getSources();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (selectedIndex){
                  this.selectedIndex=selectedIndex;
                  setState((){});

                },
                tabs:sources.map((source) {
                  return TabItem(source,sources.indexOf(source)==selectedIndex);
                }).toList()

            ),
          ),
          Expanded(
              child: TabBarView(children:
              sources.map((source) {
                return NewsDetails(source);
              }).toList(),
              )
          )
        ],
      ),
    );
  }
  getSources() {
    ApiManager.getSource(categoryId:widget.categoryId ).then((value) {
      sources = value.sources ?? [];
      setState((){});
    }).onError((error, stackTrace) {
      print(error.toString());
    }).timeout(Duration(seconds: 3),onTimeout:(){} );
  }
}
