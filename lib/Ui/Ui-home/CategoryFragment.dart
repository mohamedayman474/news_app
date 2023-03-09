import 'package:flutter/material.dart';
import 'package:news_app/Model/Category.dart';
import 'package:news_app/MyThemeData.dart';
import 'package:news_app/Ui/widgets/CategoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
 late Category selectedCategory;
 Function onCategoryClicked;
 CategoryFragment(this.onCategoryClicked);
  List<Category> categories=[
    Category(id: 'sports', title: 'Sports',
        imagePath: 'ball.png', backgroundColor: MyThemeData.red),
    Category(id: 'technology', title: 'Technology',
        imagePath: 'Politics.png', backgroundColor: MyThemeData.blue),
    Category(id: 'health', title: 'Health',
        imagePath: 'health.png', backgroundColor: MyThemeData.pink),
    Category(id: 'business', title: 'Business',
        imagePath: 'bussines.png', backgroundColor: MyThemeData.orange),
    Category(id: 'entertainment', title: 'Environment',
        imagePath: 'environment.png', backgroundColor: MyThemeData.lightBlue),
    Category(id: 'science', title: 'Science',
        imagePath: 'science.png', backgroundColor: MyThemeData.yellow)
  ];
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Container(
            margin: EdgeInsets.all(12),
            child: Text(AppLocalizations.of(context)!.pick_your_category_of_interest,
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black),),
          ),
         Expanded(
           
           child: Container(
             margin: EdgeInsets.all(8),
             child: GridView.builder(itemCount: categories.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisSpacing: 8,
                 mainAxisSpacing: 8,
                 crossAxisCount: 2,
                   
             ),itemBuilder: (context,index){
               return CategoryItem(category:categories[index],rightSided: index%2==0?false:true,
                   onCategoryClicked:onCategoryClicked ,);
             } ,),
           ),
         )

        ],
      ),
    );
  }
}
