import 'package:flutter/material.dart';
import 'package:news_app/ApiManager/ApiManager.dart';
import 'package:news_app/Model/ArticleResponse.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/Ui/Ui-home/NewsItem.dart';


class NewsDetails extends StatefulWidget {
  final Source source;

  NewsDetails(this.source);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late ScrollController scrollController;
  bool shouldLoadNextPage = false;
  List<Articles> article = [];
  int page = 1;
   late String language;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          // print('At the top');
        } else {
          //print('At the bottom');
          shouldLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    if (shouldLoadNextPage == true) {
      ApiManager.getArticles(sourceId: widget.source.id, page: ++page)
          .then((articleResponse) {
        print('page is $page');
        if (articleResponse != null) {
          setState(() {
            article.addAll(articleResponse.articles!.toList());
            print('new lenth is ${article.length}');
            shouldLoadNextPage = false;
          });
        }
      });
    }

    return Container(
      child: FutureBuilder<ArticleResponse>(
          future: ApiManager.getArticles(sourceId: widget.source.id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text('SomeThing went wrong'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Try Again',
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              if (article.isEmpty) {
                article = snapshot.data?.articles ?? [];
              }
              if (snapshot.data!.articles![0].title !=
                  article.elementAt(0).title) {
                
                article = snapshot.data!.articles ?? [];
              }
              return ListView.separated(
                  controller: scrollController,
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 4,
                    );
                  },
                  itemCount: article.length,
                  itemBuilder: (context, index) {
                    return NewsItem(article[index]);
                  });
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            }
          }),
    );
  }
}
