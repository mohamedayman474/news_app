import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/ArticleResponse.dart';

import 'package:news_app/Model/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse> getSource({String? categoryId})async{
    Uri uri=Uri.https('newsapi.org', '/v2/top-headlines/sources',{
      'apiKey':'fe055f43e3da45ea8021b760e7f7f214',
    'category':categoryId,
    });
    var response=await http.get(uri);
    var sourceResponse=SourceResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode==200){
      return sourceResponse;
    }
    throw Exception(sourceResponse.message!=null ? sourceResponse.message :'Unable to reach server');
  }
  static Future<ArticleResponse>getArticles({String? sourceId,String? searchKeyWord,int page=1})async{
    Uri uri=Uri.https('newsapi.org', '/v2/everything',{
      'apiKey':'fe055f43e3da45ea8021b760e7f7f214',
    'sources':sourceId ,
    'q':searchKeyWord,
    'page':'$page',

    });
    var response=await http.get(uri);
    var articleResponse=ArticleResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode==200){
      return articleResponse;
    }
    throw Exception(articleResponse.message!=null ? articleResponse.message :'Unable to reach server');
  }
}