import 'package:flutter/material.dart';
import 'package:news_app/ApiManager/ApiManager.dart';
import 'package:news_app/Model/ArticleResponse.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:news_app/Ui/Ui-home/NewsItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NewsSearch extends SearchDelegate {
  final String? hintText;

  @override
  String? get searchFieldLabel => hintText;
  late Future<ArticleResponse> articleResponse;

  NewsSearch({this.hintText}) {
    articleResponse = ApiManager.getArticles(searchKeyWord: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
          onPressed: () {
            articleResponse = ApiManager.getArticles(
              searchKeyWord: query
            );
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear, color: Colors.black));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<ArticleResponse>(
        future: articleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 4,
                  );
                },
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  return NewsItem(snapshot.data!.articles![index]);
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Text(AppLocalizations.of(context)!.suggestion),
    );
  }
}