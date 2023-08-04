import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Details/DetailsScreen.dart';
import 'package:news_app/Model/ArticleResponse.dart';

class NewsItem extends StatelessWidget {
 Articles articles;


 NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsScreen.ROUTE_NAME,arguments: articles);
      },
      child: Container(

       margin: const EdgeInsets.all(4),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),

            child: CachedNetworkImage(
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              imageUrl: articles.urlToImage??'',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Transform.scale(scale: 0.2 ,
                      child: CircularProgressIndicator(value: downloadProgress.progress,color: Theme.of(context).primaryColor)),
              errorWidget: (context, url, error) => const Icon(
                Icons.broken_image,
                size: 100,
                color: Colors.red,
              ),
            ),
            ),
         Container(
          margin: const EdgeInsets.all(4),
             child: Text(articles.source!.name==null?'is null':articles.source!.name!,
              textAlign: TextAlign.start,style: const TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)),
         Container(margin: const EdgeInsets.all(4),
             child: Text(articles.title!,textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
         Container(
             margin: const EdgeInsets.all(4)
             ,child: Text(articles.publishedAt==null ? 'is null':articles.publishedAt!,textAlign: TextAlign.end,
          style: const TextStyle(fontSize: 11,fontWeight: FontWeight.bold),))
        ],
       ),
      ),
    );
  }
}
