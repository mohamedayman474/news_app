import 'package:flutter/material.dart';
import 'package:news_app/Model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem(this.source,this.isSelected);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green)

      ),
      child: Text(source.name!,style: TextStyle(color: isSelected?Colors.white:Colors.green),),
    );
  }
}
