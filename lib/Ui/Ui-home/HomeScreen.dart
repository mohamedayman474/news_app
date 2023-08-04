import 'package:flutter/material.dart';
import 'package:news_app/Model/Category.dart';
import 'package:news_app/MyThemeData.dart';
import 'package:news_app/Ui/Ui-home/CategoryFragment.dart';
import 'package:news_app/Ui/Ui-home/HomeTabsFragment.dart';
import 'package:news_app/Ui/Ui-home/NewsSearch.dart';
import 'package:news_app/Ui/widgets/MyDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String ROUTE_NAME = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(
        onCategoryRowClicked: onCategoryDrawerClicked,
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24))),
        backgroundColor: MyThemeData.colorPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.news),
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: NewsSearch(
                          hintText: AppLocalizations.of(context)!.search));
                },
                icon: Icon(
                  Icons.search,
                ))
          ],
        ),
        centerTitle: true,
      ),
      body: selectedCategory != null
          ? HomeTabsFragment(selectedCategory!.id)
          : CategoryFragment(onCategoryPressed),
    );
  }

  Category? selectedCategory;

  void onCategoryDrawerClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryPressed(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }
}


