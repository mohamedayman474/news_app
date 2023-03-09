
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/Category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryItem extends StatelessWidget {
  Category category;
  bool rightSided;
  Function onCategoryClicked;
  CategoryItem({required this.category,required this.rightSided,required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClicked(category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(rightSided?0:24),
          bottomRight: Radius.circular(rightSided?24:0))

        ),

        child: Column(
          children: [
            Image.asset( 'assets/images/${category.imagePath}',height: MediaQuery.of(context).size.height*0.15,),
            Spacer(),
            Text(category.title,style: TextStyle(fontSize: 26,color: Colors.white),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
