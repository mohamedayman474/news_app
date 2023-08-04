import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Model/ArticleResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../MyThemeData.dart';

class DetailsScreen extends StatelessWidget {
  static String ROUTE_NAME = 'details screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24))),
        backgroundColor: MyThemeData.colorPrimary,
        title: Text(AppLocalizations.of(context)!.news_title),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child:CachedNetworkImage(
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                imageUrl: args.urlToImage??'',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  args.source!.name == null ? 'is null' : args.source!.name!,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  args.title!,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  args.publishedAt == null ? 'is null' : args.publishedAt!,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: EdgeInsets.all(14),
              child: Text(args.content ?? '',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            IconButton(
                onPressed: (){
              launchURL(args.url ?? '');
            },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppLocalizations.of(context)!.view_full_article, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    Icon(Icons.arrow_right,color: Colors.black,)
                  ],
                ) )
          ],
        ),
      ),
    );
  }
  launchURL(String url) async {
    final uri=Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
